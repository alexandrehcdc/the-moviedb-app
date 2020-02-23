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
        self.collectionView.backgroundColor    = .secondarySystemBackground
        
        self.navigationItem.setRightBarButtonItems([self.searchBarButtonItem],
                                                   animated: false)
        
        collectionView.register(PosterWithDescriptionCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: PosterWithDescriptionCollectionViewCell.self))
        
        self.view.addSubviews(self.locationButton)
        
        self.locationButton.anchor(bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                   trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                                   padding: UIEdgeInsets(top: 0,
                                                         left: 0,
                                                         bottom: 32,
                                                         right: 32),
                                   size: CGSize(width: 50,
                                                height: 50))
        
        self.locationButton.transformToRounded(radii: 25)

    }
    
    func toggleNavigationBarItems() {
        if self.navigationItem.rightBarButtonItem != nil {
            self.navigationItem.rightBarButtonItems = nil
            self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: self.searchBar), animated: true)
        } else {
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.setRightBarButtonItems([self.searchBarButtonItem], animated: true)
        }
    }
    
    func layPickerView() {
        DispatchQueue.main.async {
            self.view.addSubview(self.regionPickerView)
            
            self.regionPickerView.anchor(leading: self.view.safeAreaLayoutGuide.leadingAnchor,
                                         bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                         trailing: self.view.safeAreaLayoutGuide.trailingAnchor,
                                         padding: UIEdgeInsets(top: 0,
                                                               left: 0,
                                                               bottom: 0,
                                                               right: 0))
        }
    }
    
}
