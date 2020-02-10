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
        var sortedGenres: [String] = []
        
        for genre in genres {
            for movie in movies {
                let genreType = genre
                let type = movie.genres as? [String]
                //let typeSorted = type?.filter({ $0 == genreType})
                 let typeSorted = type?.filter{$0 == genreType}
                
                if let typesSorted = typeSorted{
                    for types in typesSorted {
//                        let typeObject = type as! Movies
//                        sortedMovies.append(typeObject)
                        sortedGenres.append(types)
                    }
                }
                
                
                

            }
        }
        
//        for movie in movies {
//            if let allGenres = movie.genres as? [String] {
//
//                for genre in genres {
//                    let typeSorted = allGenres.filter({ $0 == genre })
//                    let typeSortedObject = typeSorted as NSObject
//
//                    for type in typeSorted {
//                        sortedGenres.append(type)
//                    }
//                }
//            }
        
        return sortedMovies

        
        
        }
    
        
        
    
    
}
