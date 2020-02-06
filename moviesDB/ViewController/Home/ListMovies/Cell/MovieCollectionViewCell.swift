//
//  MovieCollectionViewCell.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import SDWebImage
import CoreData

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var favoriteStatus: UIImageView!
    
    var statusImage: Bool = true

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
   //     favoriteStatus.isHidden = statusImage
        
    }

    
    func verifyFavorited(_ movie: MoviesModel) -> Bool {


        let favorited = MovieDAO().getFavoriteMovies()
        let id = String(movie.id)

      //  print("ID da API: \(id)")

        for item in favorited {
            if let idMovie = item.id_API {
                if id  == idMovie {
                    print("id API REST: \(id)")
                    print("id CoreData: \(idMovie)")
                    statusImage = false
                    print("FOTO DESABILITADA: \(statusImage)")

                } else {
                    statusImage = true
                    print("foto desabilitada: \(statusImage)")
                }
            }
        }
        
        return statusImage
    }
    
    
    func configLayout(movies: MoviesModel){
        
        let movieStruct = MovieManagerConstants()
        let movieUrl = URL(string: movieStruct.defaultImageUrl + movies.poster_path )
        
        movieName.text = movies.title
        movieImageView.sd_setImage(with: movieUrl, completed: .none)
        
//        let favorited = MovieDAO().getFavoriteMovies()
//        let id = String(movies.id)
//
//        for item in favorited {
//            if let idMovie = item.id_API {
//                if id  == idMovie {
//                    status = false
//                    favoriteStatus.isHidden = false
//                } else {
//                    status = true
//                    favoriteStatus.isHidden = true
//                }
//            }
//        }
        
        
    }

}
