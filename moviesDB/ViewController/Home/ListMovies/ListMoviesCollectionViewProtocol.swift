//
//  ListMoviesCollectionViewProtocol.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

extension ListMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  //      print(listMovies.count)
                
        return listMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.configLayout(movies: listMovies[indexPath.row])
//        print("filme numero: \(indexPath.row)")
//        print("nome: \(listMovies[indexPath.row].title)")
       // cell.movieName.text = listMovies[indexPath.row].title
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.deselectItem(at: indexPath, animated: true)
        //print("agora vai -------->\(listMovies[indexPath.item].title)")
        
        let detailViewController = goToViewWithPushNavController(storyboard: "Main", identifier: "MovieDetailViewController") as? MovieDetailViewController
        detailViewController?.movies = listMovies[indexPath.row]
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = 220
        let screenHeight = 320
        return CGSize(width: screenWidth, height: screenHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == self.listMovies.count - 10 && !self.isLoading {
            loadMoreData()
        }
    }
    
    func loadMoreData() {
      //  var moreMovies: MoviesModel = []
        if !self.isLoading {
            self.isLoading = true

            DispatchQueue.global().async {
                sleep(2)
                self.loadMoreMoviesPresenter()
                print("DispatchGlobal")
                DispatchQueue.main.async {
                    print("Dispatch Queue")
                    self.moviesCollection.reloadData()
                    self.isLoading = false
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if self.isLoading {
            return CGSize.zero
        } else {
            return CGSize(width: moviesCollection.bounds.size.width, height: 55)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let aFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "loadingResuableViewID", for: indexPath) as! LoadingCollectionReusableView
            loadingView = aFooterView
            loadingView?.backgroundColor = UIColor.clear
            return aFooterView
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingView?.activityIndicator.startAnimating()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        
        if elementKind == UICollectionView.elementKindSectionFooter {
            self.loadingView?.activityIndicator.stopAnimating()
        }
    }
    
}
