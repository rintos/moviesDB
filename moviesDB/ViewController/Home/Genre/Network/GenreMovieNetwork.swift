//
//  GenreMovieNetwork.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class GenreMovieNetwork: NetworkManager {
    static func allGenres(headers: NetworkManager.Headers, completionHandler: @escaping (NSError?, [GenreModel]) -> Void) {
        let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=4b299949fc90bb34aebaf5ba4dc28389&language=en-US"
        
        requestJson(method: .get, url: url, parameters: nil, header: headers) { (response) in
            if let error = response.error {
                completionHandler(error as NSError, [])
                return
            }
            
            guard let data = response.data else { return }
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                var itensArray: [GenreModel] = []
                
                if let jsonResult = jsonResult as? JSONDict {
                    if let jsonDict = jsonResult["genres"] as? [JSONDict] {
                        for item in jsonDict {
                            let genre = GenreModelFields(jsonDict: item)
                            itensArray.append(genre)
                        }
                    }
                    
                    completionHandler(nil, itensArray)
                }
                
            } catch {
                completionHandler(error as NSError, [])
                
            }
            
            
        }
    }
}
