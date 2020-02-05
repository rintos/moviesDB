//
//  MoviesFavoriteViewController.swift
//  moviesDB
//
//  Created by Victor Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class MoviesFavoriteViewController: UIViewController {

    @IBOutlet weak var movieFavoriteTableView: UITableView!
    
    var favorites: [Movies] = []
    var listFavorites: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
    //    configPresenter()
        print("contagem de favoritos: \(favorites.count)")
        
//        MovieDAO().setupMovies()
        movieFavoriteTableView.reloadData()
        configPresenter()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        print("contagem quantidade de Favoritos: \(favorites.count)")
        configPresenter()
        movieFavoriteTableView.reloadData()
    }
    
    func configTableView(){
        
        movieFavoriteTableView.delegate = self
        movieFavoriteTableView.dataSource = self
        movieFavoriteTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewID")

        movieFavoriteTableView.reloadData()
    }
    
    
    func configPresenter(){
        let presenter = MoviesFavoritePresenter()
        presenter.attachView(view: self)
        presenter.loadFavoriteMovies()

    }
    
    func presenterLoad(){
        let presenter = MoviesFavoritePresenter()
        presenter.attachView(view: self)
        presenter.loadMovies()
    }
            
//        func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//            switch type {
//            case .delete:
//                guard let indexpath = indexPath else { return }
//                movieFavoriteTableView.deleteRows(at: [indexpath], with: .fade)
//                break
//            default:
//                movieFavoriteTableView.reloadData()
//                configPresenter()
//            }
//        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


