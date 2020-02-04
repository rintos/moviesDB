//
//  MovieDetailProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

protocol MovieDetailView {
    func onError()
    func onSucess(genres: [GenreModel])
}

extension MovieDetailViewController: MovieDetailView {
    
    func onError() {
        print("gerou erro")
    }
    
    func onSucess(genres: [GenreModel]){
        self.totalGenres = genres
        
        for genreItem in totalGenres {
               let genreId = genreItem.id
               
               for genre in genre_ids {
                   if genre == genreId {
                       self.nameGenre += " \(genreItem.name) "
                   }
               }
           }
        
    }
    
}
