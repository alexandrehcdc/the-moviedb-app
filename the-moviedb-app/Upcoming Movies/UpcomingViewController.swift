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
        label.text      = "Upcoming Movies"
        
        return label
    }()
    
    lazy var searchBarButtonItem: UIBarButtonItem! = {
        let searchBar = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchBarDidPress))
        searchBar.tintColor = .label
        
        return searchBar
    }()
    
    lazy var searchBar: UISearchBar! = {
        let searchBar = UISearchBar(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: self.view.frame.width,
                                                  height: 20))
        
        searchBar.delegate = self
        
        return searchBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
    }
    
    @objc func searchBarDidPress(sender: UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem = nil
        
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: self.searchBar), animated: true)
    }

}

