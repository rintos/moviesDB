//
//  ListMoviesViewController.swift
//  moviesDB
//
//  Created by Victor Almeida on 28/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ListMoviesViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var moviesCollection: UICollectionView!
    @IBOutlet weak var searchMovies: UISearchBar!
    @IBOutlet weak var statusSerachLabel: UILabel!
    
    
    
    var listMovies: [MoviesModel] = []
    var defaultMovies: [MoviesModel] = []
    var contentMovies: [MoviesModel] = []

    let refreshControl: UIRefreshControl = UIRefreshControl()

    var searchActiveStatus = false
    var isLoading = false
    var loadingView: LoadingCollectionReusableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configPresenter()
        configCollectionView()
        configRefreshControll()
        setupSearch()
        // Do any additional setup after loading the view.
    }
    
    func configPresenter(){
        let presenter = ListMoviesPresenter()
        presenter.attachView(view: self)
        presenter.loadMovies()
    }
    
    func configCollectionView(){
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
        moviesCollection.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
        configReusableCollection()
        
        statusSerachLabel.isHidden = true
    }
    
    
    func configReusableCollection(){
        let loadingReusableNib = UINib(nibName: "LoadingCollectionReusableView", bundle: nil)
        
        moviesCollection.register(loadingReusableNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "loadingResuableViewID")
    }
    

    func configRefreshControll() {
        refreshControl.addTarget(self, action: #selector(loadMovies), for: UIControl.Event.valueChanged)
        moviesCollection.addSubview(refreshControl)
    }
    
    @objc func loadMovies(){
      paginas = 1
      let presenter = ListMoviesPresenter()
      presenter.attachView(view: self)
      presenter.loadMovies()
        print("refresh control funcionando")
        statusSerachLabel.isHidden = true

    }

    func loadMoreMoviesPresenter(){
          paginas += 1
        let presenter = ListMoviesPresenter()
        presenter.attachView(view: self)
        presenter.loadMoreMoviesWithPresenter()
        print("Numero de paginas ---> : \(paginas)")
    }
    
    func setupSearch(){
        searchMovies.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchBar.text == "" {
            searchActiveStatus = false
            statusSerachLabel.isHidden = true
        } else {
            searchActiveStatus = true
            statusSerachLabel.isHidden = false

        }
        
        guard !searchText.isEmpty else {
            listMovies = contentMovies
            moviesCollection.reloadData()
            return
        }
        
        listMovies = contentMovies.filter({ (content) -> Bool in
            (content.title.lowercased().contains(searchText.lowercased()))
        })
        
        let resultStatusLabel = String(listMovies.count)
        if listMovies.count == 1 {
            statusSerachLabel.text = "\(resultStatusLabel) filme encontrado."
        } else if listMovies.count > 1 {
            statusSerachLabel.text = "\(resultStatusLabel) filmes encontrados."
        } else {
            statusSerachLabel.text = "Não foi encontrado filme com esse nome"
        }
        
        moviesCollection.reloadData()
    }
    
    // ao finalizar serach esconde a barra de status carregamento
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("finalizei a procura")
        self.loadingView?.activityIndicator.stopAnimating()
        self.loadingView?.activityIndicator.isHidden = true
       // statusSerachLabel.isHidden = false
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.loadingView?.activityIndicator.stopAnimating()
        self.loadingView?.activityIndicator.isHidden = true

    }
    

}