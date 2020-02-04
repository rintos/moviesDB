//
//  MovieGenrePresenter.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class MovieGenrePresenter {
    
    var view: MovieDetailView!
    
    func attachView(view: MovieDetailView){
        self.view = view
    }
    
    func loadGenres(){
        
        let headers = [
            "genres" : ""
        ]
        
        GenreMovieNetwork.allGenres(headers: headers) { (error, genres) in
            if error != nil {
                self.view.onError()
                return
            }
            
            self.view.onSucess(genres: genres)
            
        }
        
    }
    
    func saveFavoriteMovie() {
        
        let detailMovie = MovieDetailViewController()

        if let movie = detailMovie.getMovie() {
            print("filme carregado no presenter: \(movie.title)")
        }
    }
    
    
}
