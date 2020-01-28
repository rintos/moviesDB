//
//  ListMoviesNetwork.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ListMoviesNetwork: NetworkManager {
    static func lastMoviesRoute(headers: NetworkManager.Headers, completionHandler: @escaping (NSError?, [MoviesModel]) -> Void ) {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=4b299949fc90bb34aebaf5ba4dc28389&language=en-US&page=1"
        
        requestJson(method: .get, url: url, parameters: nil, header: headers) { (response) in
            
            if let error = response.error {
                completionHandler(error as NSError?, [])
            }
            
            guard let data = response.data else { return }
            
            do {
                
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let jsonResult = jsonResult as? [JSONDict] {
                    var itensArray: [MoviesModel] = []
                    
                    for item in jsonResult {
                        let movie = MoviesModelFields(jsonDict: item)
                        itensArray.append(movie)
                        
                    }
                    
                    completionHandler(nil, itensArray)
                    
                }
                
                
            }catch {
                completionHandler(error as NSError, [])
            }
            
        }
        
    }
}
