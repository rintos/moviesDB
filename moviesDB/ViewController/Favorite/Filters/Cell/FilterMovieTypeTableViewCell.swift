//
//  FilterMovieTypeTableViewCell.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class FilterMovieTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var movieFeatureTypeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func confiCell(_ type: String){
        
        if type == "0" {
           movieFeatureTypeLabel.text = "Ano de Lançamento"
        }
        
        if type == "1" {
            movieFeatureTypeLabel.text = "Genero"
        }
        
        
    }
    
}
