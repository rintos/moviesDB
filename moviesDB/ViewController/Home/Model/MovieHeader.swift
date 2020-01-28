//
//  MovieHeader.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import Foundation

protocol MovieHeader {
    var page: Int { get }
    var total_results: Int { get }
    var total_pages: Int { get }
}

struct MovieHeaderField: MovieHeader {
    var page: Int
    var total_results: Int
    var total_pages: Int
    
    init(jsonDict: JSONDict) {
        page = jsonDict["page"] as? Int ?? 0
        total_results = jsonDict["total_results"] as? Int ?? 0
        total_pages = jsonDict["total_pages"] as? Int ?? 0
    }
    
}



