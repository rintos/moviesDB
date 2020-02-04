//
//  MovieTableViewCell.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 03/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var imageTableViewCell: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(_ movies: Movies) {
        let imagePath = MovieManagerConstants()
        let posterPath = movies.poster_path ?? ""
        var pathImage = URL(string: imagePath.defaultImageUrl + posterPath)
        
        imageView?.sd_setImage(with: pathImage, completed: .none)

        movieTitleLabel.text = movies.title
    }
    
}
