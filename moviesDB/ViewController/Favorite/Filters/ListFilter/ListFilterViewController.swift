//
//  ListFilterViewController.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ListFilterViewController: UIViewController {

    @IBOutlet weak var filtroVoltarButton: UIBarButtonItem!
    
    @IBOutlet weak var listFilterTableView: UITableView!
    
    var listGenres: MovieManagerConstants!
    let filterMoviesController = FilterMoviesViewController()

    
    var listTypeFilter: [String] = []
    var selectedTypes: [String] = []

    
    var filtersTypes: ((_ selectedTypes: [String])->())?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configTableView()
        configNavBarButton()
    }
    
    func configNavBarButton() {
        filtroVoltarButton.isEnabled = true
        navigationItem.leftBarButtonItem = filtroVoltarButton
    }
    
    
    func configTableView () {
        listFilterTableView.delegate = self
        listFilterTableView.dataSource = self
        
        listFilterTableView.register(UINib(nibName: "ListFilterTableViewCell", bundle: nil), forCellReuseIdentifier: "listFilterID")
        
    }

//    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
//        let viewFilter = goToViewWithPushNavController(storyboard: "Favorite", identifier: "FilterMoviesViewController") as? FilterMoviesViewController
//        viewFilter?.filter = selectedTypes
//        filterMoviesController.filter = selectedTypes
//
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//
//        let filterMoviesController = FilterMoviesViewController()
//        if self.isMovingFromParent{
//            filterMoviesController.filter = selectedTypes
//        }
//    }
    
    @IBAction func backFilterButton(_ sender: Any) {
        filtersTypes?(selectedTypes)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    

}
