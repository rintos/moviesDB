//
//  MoviesFavoritePresenter.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 04/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class MoviesFavoritePresenter: NSObject {

    var view: MovieFavoriteView!
    
    func attachView(view: MovieFavoriteView) {
        self.view = view
    }
    
    func loadFavoriteMovies() {
        self.view.loadFavorite()
    }
    
}
