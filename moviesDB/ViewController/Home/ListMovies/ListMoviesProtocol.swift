//
//  ListMoviesProtocol.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import CoreData

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
        
        let savedMovies = MovieDAO().getFavoriteMovies()
        
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
                self.listMovies = movies
                self.contentMovies = movies
                self.defaultMovies = movies
                self.totalMovies = movies
                
                for saved in savedMovies {
                    guard let idSaved = saved.id_API else { return }
                    if let idFavorite = Int(idSaved) {
                        self.totalMovies = self.totalMovies.map{
                            var mutableMovies = $0
                            if $0.id == idFavorite {
                                mutableMovies.favoriteHidden = false
                            }
                            return mutableMovies
                        }
                    }
                }
                self.moviesCollection.reloadData()
            }
    }
    
    //Adiciona mais  filmes no array ao finalzar scroll da tela
    func listRefreshMovies(movies: [MoviesModel]){
        for item in movies {
            self.totalMovies.append(item)
            self.contentMovies.append(item)
        }
        moviesCollection.reloadData()
    }
    
}
