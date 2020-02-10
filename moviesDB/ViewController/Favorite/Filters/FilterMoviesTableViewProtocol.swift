//
//  FilterMoviesTableViewProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import CoreData

extension FilterMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieManagerConstants.listTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellFeatureType", for: indexPath) as! FilterMovieTypeTableViewCell
        cell.confiCell(MovieManagerConstants.listTypes[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filterViewController = goToViewWithPushNavController(storyboard: "Favorite", identifier: "ListFilterViewController") as? ListFilterViewController
        if MovieManagerConstants.listTypes[indexPath.row] == "0" {
            filterViewController?.listTypeFilter = MovieManagerConstants.movieDate
            filterViewController?.filtersTypes = { years,filterStatus in
                self.listYearTypeFilter = years
                self.hasFilterIsEnable = filterStatus
            }
        }
        if MovieManagerConstants.listTypes[indexPath.row] == "1" {
            filterViewController?.listTypeFilter = MovieManagerConstants.movieGenre
            filterViewController?.filtersTypes = { genres, filterStatus in
                self.listGenreTypeFilter = genres
                self.hasFilterIsEnable = filterStatus
            }
        }
  
    }
    
    
//    let detailViewController = goToViewWithPushNavController(storyboard: "Main", identifier: "MovieDetailViewController") as? MovieDetailViewController
//    detailViewController?.movies = totalMovies[indexPath.row]
    
}
