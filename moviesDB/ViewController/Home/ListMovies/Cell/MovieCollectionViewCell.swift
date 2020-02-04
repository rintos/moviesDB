//
//  MovieCollectionViewCell.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configLayout(movies: MoviesModel){
        
        let movieStruct = MovieManagerConstants()
        let movieUrl = URL(string: movieStruct.defaultImageUrl + movies.poster_path )
        
        movieName.text = movies.title
        movieImageView.sd_setImage(with: movieUrl, completed: .none)
        
    }
    
    
    
    

}
