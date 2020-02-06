//
//  ListFilterTableViewCell.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ListFilterTableViewCell: UITableViewCell {

    @IBOutlet weak var genresLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
