//
//  MoviesFavoriteViewController.swift
//  moviesDB
//
//  Created by Victor Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class MoviesFavoriteViewController: UIViewController {

    @IBOutlet weak var movieFavoriteTableView: UITableView!
    
    var listFavorites: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
        MovieDAO().setupMovies()
        movieFavoriteTableView.reloadData()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        movieFavoriteTableView.reloadData()
    }
    
    func configTableView(){
        
        movieFavoriteTableView.delegate = self
        movieFavoriteTableView.dataSource = self
        movieFavoriteTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewID")

        movieFavoriteTableView.reloadData()
    }
            
        
    }

