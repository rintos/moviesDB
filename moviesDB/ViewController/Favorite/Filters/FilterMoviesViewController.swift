//
//  FilterMoviesViewController.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class FilterMoviesViewController: UIViewController {
    
    @IBOutlet weak var filterTypeTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
    }
    
    
    
    func configTableView(){

        filterTypeTableView.delegate = self
        filterTypeTableView.dataSource = self
        filterTypeTableView.register(UINib(nibName: "FilterMovieTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFeatureType")
            
        filterTypeTableView.reloadData()
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