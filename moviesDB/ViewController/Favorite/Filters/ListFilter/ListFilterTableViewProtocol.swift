//
//  ListFilterTableViewProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

extension ListFilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieManagerConstants.movieGenre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listFilterID", for: indexPath) as? ListFilterTableViewCell
        
        cell!.genresLabel.text = MovieManagerConstants.movieGenre[indexPath.row]
        
        return cell!
    }
    
    
}
