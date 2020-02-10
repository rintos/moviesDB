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
    
    @IBOutlet weak var filterButtonStatus: UIBarButtonItem!
    
    
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
    
    func configButton() {
        //pencil.circle.fill
        
        let image = UIImage.init(systemName: "pencil.circle.fill")
        
        filterButtonStatus.image = image
    }
    
    func configTableView(){
        
        movieFavoriteTableView.delegate = self
        movieFavoriteTableView.dataSource = self
        movieFavoriteTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewID")

        movieFavoriteTableView.reloadData()
    }
    
    func setFilter(_ movies: [Movies],_ years: [String],_ genres: [String] ) {
        
       // self.hasfilter = true
        if hasfilter {
            configButton()
        }
        
        if years.count > 0 {
            self.listMovies = FilterManager.setYearFilter(self.listMovies, years)
        }
        
        if genres.count > 0 {
            self.listMovies = FilterManager.setGenreFilter(self.listMovies, genres)
        }
        
        movieFavoriteTableView.reloadData()
    }
    
//    func setFiltersDefined(years: [String] = []){
//        self.years = years
//    
//    }
    


    @IBAction func filterButton(_ sender: Any) {
        
       // hasfilter = true
        
        let storyboard = UIStoryboard(name: "Favorite", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FilterMoviesViewController") as! FilterMoviesViewController
        viewController.filter = { yearType, genreType, filterStatus in
            self.years = yearType
            self.genres = genreType
            self.hasfilter = filterStatus
        }
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
    
    @IBAction func clearFilter(_ sender: Any) {
        hasfilter = false
        
        let image = UIImage.init(systemName: "pencil.circle")
               
        filterButtonStatus.image = image
        
        configPresenter()
        movieFavoriteTableView.reloadData()
    }
    
    
    
}

