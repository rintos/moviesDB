//
//  MoviesFavoriteViewController.swift
//  moviesDB
//
//  Created by Victor Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import CoreData

class MoviesFavoriteViewController: UIViewController {

    @IBOutlet weak var movieFavoriteTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
    }
    

    func configTableView(){
        
        movieFavoriteTableView.delegate = self
        movieFavoriteTableView.dataSource = self
        movieFavoriteTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieTableViewID")

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
