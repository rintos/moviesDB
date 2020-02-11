//
//  FilterManager.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 07/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

struct FilterManager {
    
    
    
    static func setYearFilter(_ movies: [Movies],_ years: [String])-> [Movies] {
        
        var sortedMovies: [Movies] = []
        
        for year in years {
            let typeSorted = movies.filter({ $0.year == year })
            
            for type in typeSorted {
                sortedMovies.append(type)
            }
        }
        
        return sortedMovies
    }
    
    static func setGenreFilter(_ movies: [Movies],_ genres: [String])-> [Movies] {
        
        var sortedMovies: [Movies] = []
                
        for genre in genres {
            for movie in movies {
                let genreType = genre
                let types = movie.genres as! [NSObject]
                let genreTypeobject = genreType as NSObject
                
                for type in types {
                    if type == genreTypeobject {
                        sortedMovies.append(movie)
                    }
                }
            }
        }
        return sortedMovies
    }
    
}
