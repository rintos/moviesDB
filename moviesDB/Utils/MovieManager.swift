//
//  MovieManager.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import Foundation

struct MovieManagerConstants {
    let defaultImageUrl =  "https://image.tmdb.org/t/p/w500"
    public var pages = 1
    static let movieFilterDate = 0
    static let movieFilterGenre = 1
    static let listTypes: [String] = ["0", "1"]
    
    static var movieDate: [String] = ["2020", "2019", "2018", "2017", "2016", "2015"]
    static var movieGenre: [String] = ["Action", "Adventure", "Animation", "Crime" ,"Comedy", "Documentary", "Drama", "Family", "Fantasy", "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "TV Movie", "Thriller", "War", "Western"]
    
}

class MovieManager: NSObject {
    
    
}
