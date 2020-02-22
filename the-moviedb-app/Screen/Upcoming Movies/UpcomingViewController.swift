//
//  UpcomingMoviesViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UICollectionViewController {
    
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
    
    lazy var searchBarButtonItem: UIBarButtonItem! = {
        let searchBarItem       = UIBarButtonItem(barButtonSystemItem: .search,
                                                  target: self,
                                                  action: #selector(searchBarDidPress))
        searchBarItem.tintColor = .label
        
        return searchBarItem
    }()
    
    lazy var searchBar: UISearchBar! = {
        let searchBar = UISearchBar(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: self.view.frame.width,
                                                  height: 20))
        
        searchBar.delegate = self
        
        return searchBar
    }()
    
    lazy var moreOptionsBarButtonItem: UIBarButtonItem! = {
        let buttonItem       = UIBarButtonItem(barButtonSystemItem: .action,
                                               target: self,
                                               action: #selector(moreOptionsDidPress))
        buttonItem.tintColor = .label
        
        return buttonItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
    }
    
    @objc func searchBarDidPress(sender: UIBarButtonItem) {
        self.toggleNavigationBarItems()
        
        // MARK: TODO
    }
    
    @objc func moreOptionsDidPress(sender: UIBarButtonItem) {
        // MARK: TODO
    }

}

