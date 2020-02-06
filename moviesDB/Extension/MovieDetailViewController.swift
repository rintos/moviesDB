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
    @IBOutlet weak var saveMovieButton: UIButton!
    
    
    
    var movies: MoviesModel!
    var genre_ids: [Int] = []
  //  var genreDict: [String: Any] = [:]
    var totalGenres: [GenreModel] = []
    var nameGenre = ""
    let favoriteMovies = MoviesFavoriteViewController()
    var listGenres: [String] = []


    var presenter:MovieGenrePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     //   print("Detalhe do filme:\(movies.overview)")
        configPresenter()
        configLayout()
        configButtonItem()
        
      
        
    }
        
    override func viewDidAppear(_ animated: Bool) {
        configLayout()
    }
    
    func configButtonItem() {
        let buttonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(saveMovies))
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc func saveMovies(){
        MovieDAO().saveMovie(self.movies, self.listGenres)
    }
    
    func configLayout(){
        
        let imagePath = MovieManagerConstants()
        let imageUrl = URL(string: imagePath.defaultImageUrl + movies.poster_path)
        
        movieImageView.sd_setImage(with: imageUrl, completed: .none)
        titleMovieLabel.text = movies.title
        yearMovieLabel.text = movies.release_date
        overviewMovieText.text = movies.overview
        genre_ids = movies.genre_ids
        for item in self.listGenres {
            nameGenre += " \(item) "
        }
        genreMovieLabel.text =  nameGenre

        
    }
    
    func configPresenter(){
        let presenter = MovieGenrePresenter()
        presenter.attachView(view: self)
        presenter.loadGenres()
        
    }
    
     func getMovie() -> MoviesModel? {
        guard let  movie = movies else { return nil}
        return movie
    }
    
    
    @IBAction func saveMovieButtonAction(_ sender: Any) {
    
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
