//
//  ListMoviesProtocol.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

protocol ListMoviesView {
    func onError()
    func onSucess(movies: [MoviesModel])
    func listRefreshMovies(movies: [MoviesModel])
}

extension ListMoviesViewController: ListMoviesView {
    
    func onError() {
        print("gerou erro")
        refreshControl.endRefreshing()
    }
    
    
    func onSucess(movies: [MoviesModel]) {
        
        DispatchQueue.global().async {
            sleep(2)
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.listMovies = movies
                self.contentMovies = movies
                self.defaultMovies = movies
                
                self.moviesCollection.reloadData()
            }
        }
        

    }
    
    func listRefreshMovies(movies: [MoviesModel]){
        for item in movies {
            self.listMovies.append(item)
            self.contentMovies.append(item)
        }
        moviesCollection.reloadData()
    }
    
}
