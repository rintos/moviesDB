//
//  ListFilterViewController.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ListFilterViewController: UIViewController {

    
    @IBOutlet weak var listFilterTableView: UITableView!
    
    var listGenres: MovieManagerConstants!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configTableView()
    }
    
    
    func configTableView () {
        listFilterTableView.delegate = self
        listFilterTableView.dataSource = self
        
        listFilterTableView.register(UINib(nibName: "ListFilterTableViewCell", bundle: nil), forCellReuseIdentifier: "listFilterID")
        
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
