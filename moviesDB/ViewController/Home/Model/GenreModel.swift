//
//  GenreModel.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import Foundation

protocol GenreModel {
    var id: Int { get }
    var name: String { get }
}

struct GenreModelFields: GenreModel {
    let id: Int
    let name: String
    
    init(jsonDict: JSONDict) {
        id = jsonDict["id"] as? Int ?? 0
        name = jsonDict["name"] as? String ?? ""
    }
    
    init() {
        id = 0
        name = ""
    }
}
