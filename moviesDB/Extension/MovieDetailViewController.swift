//
//  MovieDetailViewController.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import SDWebImage
import CoreData

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var yearMovieLabel: UILabel!
    @IBOutlet weak var genreMovieLabel: UILabel!
    @IBOutlet weak var overviewMovieText: UITextView!
    
    var movies: MoviesModel!
    var genre_ids: [Int] = []
  //  var genreDict: [String: Any] = [:]
    var totalGenres: [GenreModel] = []
    var nameGenre = ""

    var presenter: ListMoviesPresenter!
    let refreshControl: UIRefreshControl = UIRefreshControl()
        

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     //   print("Detalhe do filme:\(movies.overview)")
        configPresenter()
        configLayout()
        configButtonItem()
        
    }
        
    override func viewDidAppear(_ animated: Bool) {
        configPresenter()
        configLayout()
    }
    
    func configButtonItem() {
        let buttonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(saveMovie))
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc func saveMovie(){
        print("Save Movie")
        MovieDAO.saveMovie(movies)
    }
    
    func configLayout(){
        
        let imagePath = MovieManagerConstants()
        let imageUrl = URL(string: imagePath.defaultImageUrl + movies.poster_path)
        
        movieImageView.sd_setImage(with: imageUrl, completed: .none)
        titleMovieLabel.text = movies.title
        yearMovieLabel.text = movies.release_date
        overviewMovieText.text = movies.overview
        genre_ids = movies.genre_ids
        genreMovieLabel.text =  nameGenre
        
    }
    
    func configPresenter(){
        let presenter = MovieGenrePresenter()
        presenter.attachView(view: self)
        presenter.loadGenres()
        
    }
    
    func configRefreshControll() {
        refreshControl.addTarget(self, action: #selector(loadMovies), for: UIControl.Event.valueChanged)

    }
    
    @objc func loadMovies(){
        presenter.loadMovies()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
