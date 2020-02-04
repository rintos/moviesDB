//
//  MoviesFavoriteTableViewProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 03/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

extension MoviesFavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewID", for: indexPath) as! MovieTableViewCell
        
        cell.movieTitleLabel.text = "teste"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
