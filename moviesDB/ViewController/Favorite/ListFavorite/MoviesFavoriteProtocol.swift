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
}

extension MoviesFavoriteViewController: MovieFavoriteView {
        
    func loadFavorite () {
        let movie = MovieDAO().getFavoriteMovies()
         for item in movie {
            favorites.append(item)
         }
        movieFavoriteTableView.reloadData()
    }
    
    
}
