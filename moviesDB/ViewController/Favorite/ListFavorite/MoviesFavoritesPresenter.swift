//
//  MoviesFavoritesPresenter.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 07/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import CoreData

class MoviesFavoritesPresenter: NSObject {

    var view: MoviesFavoriteView!
    
    func attachView(view: MoviesFavoriteView) {
        self.view = view
    }
    
    
    func loadMovies() {
        let totalMoviesSaved = MovieDAO().getFavoriteMovies()
        
        self.view.onSucess(movies: totalMoviesSaved)
        
    }
    
    
    
}
