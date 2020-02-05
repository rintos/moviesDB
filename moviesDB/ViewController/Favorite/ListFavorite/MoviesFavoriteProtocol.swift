//
//  MoviesFavoriteProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 04/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

protocol MovieFavoriteView {
    func loadFavorite()
    func loadMovies()
}

extension MoviesFavoriteViewController: MovieFavoriteView {
        
    func loadFavorite () {
        favorites = MovieDAO().getFavoriteMovies()
        movieFavoriteTableView.reloadData()
    }
    
    func loadMovies() {
        movieFavoriteTableView.reloadData()
    }
    
    
}
