//
//  MoviesFavoriteTableViewProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 03/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import CoreData

extension MoviesFavoriteViewController: UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        self.listFavorites = MovieDAO().getFavoriteMovies()
//        return self.listFavorites.count
        return self.listMovies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewID", for: indexPath) as! MovieTableViewCell
        
//        let favorited = MovieDAO().getFavoriteMovies()
//        let fav = favorited[indexPath.row]
//        guard let genres = fav.genres as? [String] else { return cell}
//        cell.configCell(fav)
        let fav = self.listMovies[indexPath.row]
        print("Genero do filme salvo:\(String(describing: fav.genres))")
        cell.configCell(fav)
        
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            //let movies = MovieDAO().getFavoriteMovies()
            let movieSelected = self.listMovies[indexPath.row]
            MovieDAO().deleteMovie(movie: movieSelected)
            MovieDAO().updateContext()
            configPresenter()

        }
        
    }
        
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            guard let indexpath = indexPath else {return}
            movieFavoriteTableView.deleteRows(at: [indexpath], with: .fade)
            break
        default:
            configPresenter()
        }
    }
    
    
}

