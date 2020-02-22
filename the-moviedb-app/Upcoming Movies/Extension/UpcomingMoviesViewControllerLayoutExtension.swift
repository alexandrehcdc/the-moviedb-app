//
//  UpcomingMoviesViewControllerLayoutExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/21/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UpcomingMoviesViewController {
    
    func setLayout() {
        self.navigationItem.titleView          = self.navigationTitleLabel
        self.navigationItem.setRightBarButtonItems([self.moreOptionsBarButtonItem, self.searchBarButtonItem], animated: false)
        self.collectionView.backgroundColor    = .secondarySystemBackground
        collectionView.register(PosterWithDescriptionCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: PosterWithDescriptionCollectionViewCell.self))
        
        
    }
    
    func toggleNavigationBarItems() {
        if self.navigationItem.rightBarButtonItem != nil {
            self.navigationItem.rightBarButtonItems = nil
            self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: self.searchBar), animated: true)
        } else {
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.setRightBarButtonItems([self.moreOptionsBarButtonItem, self.searchBarButtonItem], animated: true)
        }
    }
    
}
