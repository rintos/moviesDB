//
//  MoviesFavoritesProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 07/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

protocol MoviesFavoriteView {
    func onError()
    func onSucess(movies: [Movies])
}

extension MoviesFavoriteViewController: MoviesFavoriteView {
    func onError() {
        print("Gerou erro")
    }
    
    func onSucess(movies: [Movies]) {
        self.listMovies = movies
        movieFavoriteTableView.reloadData()
    }
    
    
}
