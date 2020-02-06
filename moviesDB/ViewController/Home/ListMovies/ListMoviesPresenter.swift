//
//  ListMoviesPresenter.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ListMoviesPresenter {
    
    var view: ListMoviesView!
    
    func attachView(view: ListMoviesView) {
        self.view = view
    }
    
    func loadMovies(){
        
        let parameters = [
            "page" : "1",
            "total_results" : "10000",
            "total_pages" : "500",
            ]
        
        ListMoviesNetwork.lastMoviesRoute(headers: parameters) { (error, movies) in
            if error != nil {
                self.view.onError()
                return
            }
                        
            self.view.onSucess(movies: movies)
          //  print("Total de dados: \(movies)")
            
//            for item in movies {
//                print("filmes:\(item.overview)")
//            }
        
        }
        
        
    }
    
    
    func loadMoreMoviesWithPresenter(){
        let parameters = [
        "page" : "1",
        "total_results" : "10000",
        "total_pages" : "500",
        ]

        ListMoviesNetwork.lastMoviesRoute(headers: parameters) { (error, moreMovies) in
            if error != nil {
                self.view.onError()
                return
            }
            
            
            
            
          self.view.listRefreshMovies(movies: moreMovies)

        }
    }

    
}
