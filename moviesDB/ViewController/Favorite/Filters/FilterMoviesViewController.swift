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
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    
    
   // var filterTypes: ((_ selectedTypes: [String])->())?
   // var filter: [String] = []
    var listGenreTypeFilter: [String] = []
    var listYearTypeFilter: [String] = []
    var filter: ((_ year: [String],_ genre:[String],_ hasFilterIsEnable: Bool)-> ())?
    var hasFilterIsEnable: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        configTabBar()
        configNavigationButton()
                
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        for item in listGenreTypeFilter {
            print("Os generos selecionado foram: \(item)")
        }
        for item in listYearTypeFilter {
            print("Os anos selecionados: \(item)")
        }
        
    }
    
    func configTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func configNavigationButton() {
        navigationItem.rightBarButtonItem = filterButton
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func configTableView(){

        filterTypeTableView.delegate = self
        filterTypeTableView.dataSource = self
        filterTypeTableView.register(UINib(nibName: "FilterMovieTypeTableViewCell", bundle: nil), forCellReuseIdentifier: "cellFeatureType")
            
        filterTypeTableView.reloadData()
    }

    @IBAction func doneFilter(_ sender: Any) {
        filter?(listYearTypeFilter,listGenreTypeFilter, hasFilterIsEnable)
        navigationController?.popViewController(animated: true)
    }
    
    


}
