//
//  UpcomingMoviesViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UICollectionViewController {
    
    var isSearchActive: Bool           = false
    var currentPage: Int               = 1
    var availableGenres: [GenreEntity] = []
    
    var searchTaskManager: DispatchWorkItem!
    
    var movies: [MovieDTO] = [] {
        didSet {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
    }
    
    var filteredMovies: [MovieDTO] = [] {
        didSet {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
    }
    
    lazy var presenter: UpcomingMoviesPresenterContract = UpcomingMoviesPresenter(view: self)
    
    lazy var navigationTitleLabel: UILabel! = {
        let label = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: self.view.frame.width - 32,
                                          height: self.view.frame.height))
        
        label.font      = UIFont.helveticaNeue(size: 20)
        label.textColor = .label
        label.text      = AppStrings.upcoming_movies.capitalized
        
        return label
    }()
    
    lazy var searchBarButtonItem: UIBarButtonItem! = { [unowned self] in
        let searchBarItem       = UIBarButtonItem(barButtonSystemItem: .search,
                                                  target: self,
                                                  action: #selector(searchBarDidPress))
        searchBarItem.tintColor = .label
        
        return searchBarItem
    }()
    
    lazy var searchBar: UISearchBar! = { [unowned self] in
        let searchBar = UISearchBar(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: self.view.frame.width,
                                                  height: 20))
        
        searchBar.delegate = self
        
        return searchBar
    }()
    
    lazy var moreOptionsBarButtonItem: UIBarButtonItem! = { [unowned self] in
        let buttonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                         target: self,
                                         action: #selector(moreOptionsDidPress))
        buttonItem.tintColor = .label
        
        return buttonItem
    }()
    
    deinit {
        self.navigationTitleLabel     = nil
        self.searchBarButtonItem      = nil
        self.searchBar                = nil
        self.moreOptionsBarButtonItem = nil
        self.searchTaskManager        = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
        
        self.presenter.fetchGenres()
    }
    
    @objc func searchBarDidPress(sender: UIBarButtonItem) {
        self.toggleNavigationBarItems()
    }
    
    @objc func moreOptionsDidPress(sender: UIBarButtonItem) {
        // MARK: TODO
    }

}
