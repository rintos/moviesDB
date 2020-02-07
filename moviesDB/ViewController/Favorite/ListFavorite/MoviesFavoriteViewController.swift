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
    
    
    let constants = MovieManagerConstants.self
    
    var listFavorites: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
      //  MovieDAO().setupMovies()
        movieFavoriteTableView.reloadData()
        configTabBar()
        

    }
    

    override func viewDidAppear(_ animated: Bool) {
        movieFavoriteTableView.reloadData()
        configTabBar()

    }
    
    func setupCoreData() {
        self.listFavorites = MovieDAO().getFavoriteMovies()
    }
    
    func configTabBar() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func configTableView(){
        
        movieFavoriteTableView.delegate = self
        movieFavoriteTableView.dataSource = self
        movieFavoriteTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewID")

        movieFavoriteTableView.reloadData()
    }


    @IBAction func filterButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Favorite", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterMoviesViewController") as! FilterMoviesViewController
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}

