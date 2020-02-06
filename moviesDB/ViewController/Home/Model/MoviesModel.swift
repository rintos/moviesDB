//
//  MoviesModel.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import Foundation

typealias JSONDict = [String : Any]

protocol MoviesModel {
    var vote_count: Int { get }
    var id: Int { get }
    var video: Bool { get }
    var vote_average: Double { get }
    var title: String { get }
    var popularity: Double { get }
    var poster_path: String { get }
    var original_language: String { get }
    var original_title: String { get }
    var genre_ids: Array<Int> { get }
    var backdrop_path: String { get }
    var adult: Bool { get }
    var overview: String  { get }
    var release_date: String { get }
    var favoriteHidden: Bool { get set }
}

struct MoviesModelFields: MoviesModel {
    let vote_count: Int
    let id: Int
    let video: Bool
    let vote_average: Double
    let title: String
    let popularity: Double
    let poster_path: String
    let original_language: String
    let original_title: String
    let genre_ids: Array<Int>
    let backdrop_path: String
    let adult: Bool
    let overview: String
    let release_date: String
    var favoriteHidden: Bool
    
    init(jsonDict: JSONDict) {
        vote_count = jsonDict["vote_count"] as? Int ?? 0
        id = jsonDict["id"] as? Int ?? 0
        video = jsonDict["video"] as? Bool ?? false
        vote_average = jsonDict["vote_average"] as? Double ?? 0.0
        title = jsonDict["title"] as? String ??  ""
        popularity = jsonDict["popularity"] as? Double ?? 0.0
        poster_path = jsonDict["poster_path"] as? String ?? ""
        original_language = jsonDict["original_language"] as? String ?? ""
        original_title = jsonDict["original_title"] as? String ?? ""
        genre_ids = jsonDict["genre_ids"] as? Array<Int> ?? [0]
        backdrop_path = jsonDict["backdrop_path"] as? String ?? ""
        adult = jsonDict["adult"] as? Bool ?? false
        overview = jsonDict["overview"] as? String ?? ""
        release_date = jsonDict["release_date"] as? String ?? ""
        favoriteHidden = true
        
    }
    
    init() {
        vote_count = 0
        id = 0
        video = false
        vote_average = 0.0
        title = ""
        popularity = 0.0
        poster_path = ""
        original_language = ""
        original_title = ""
        genre_ids = [0]
        backdrop_path = ""
        adult = false
        overview = ""
        release_date = ""
        favoriteHidden = false
    }
    
}
