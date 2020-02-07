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
    var hasfilter: Bool = false
    var genres: [String] = []
    var years: [String] = []
    var listMovies: [Movies] = []
    
    var presenter: MoviesFavoritesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
      //  MovieDAO().setupMovies()
       // movieFavoriteTableView.reloadData()
        configTabBar()
        configPresenter()
        

    }

    override func viewDidAppear(_ animated: Bool) {
        movieFavoriteTableView.reloadData()
        configTabBar()
        
        for item in years {
            print("Anos Selecionados que foi retornado para a tela de favoritos: \(item)")
        }
        configPresenter()

    }
    
    
    
    func configPresenter() {
        let presenter = MoviesFavoritesPresenter()
        presenter.attachView(view: self)
        presenter.loadMovies()
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
    
    func setFilter(_ movies: [Movies],_ years: [String]) {
        
        self.hasfilter = true
        
        if years.count > 0 {
            self.listFavorites = FilterManager.setYearFilter(self.listFavorites, years)
        }
        
        movieFavoriteTableView.reloadData()
    }
    


    @IBAction func filterButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Favorite", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterMoviesViewController") as! FilterMoviesViewController
        viewController.filter = { yearType, genreType in
            self.years = yearType
            self.genres = genreType
        }
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}

