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
    
    func resetCollectionViewEmptyResults() {
        self.collectionView.backgroundView = nil
        if let taskManager = self.viewTaskManager {
            taskManager.cancel()
        }
    }
    
    func setCollectionViewEmptyResults() {
        if let taskManager = self.viewTaskManager {
            taskManager.cancel()
        }
        
        let container                     = UIView(frame: self.collectionView.frame)
        let noResultsTitleLabel           = UILabel()
        let noResultsTextDescriptionLabel = UILabel()
        
        noResultsTitleLabel.text                    = "No results"
        noResultsTextDescriptionLabel.text          = "We couldn't find any movies matching your search."
        noResultsTitleLabel.textColor               = .label
        noResultsTextDescriptionLabel.textColor     = .secondaryLabel
        noResultsTitleLabel.font                    = UIFont.helveticaNeueLight(size: 20)
        noResultsTextDescriptionLabel.font          = UIFont.helveticaNeueLight(size: 16)
        noResultsTitleLabel.textAlignment           = .center
        noResultsTextDescriptionLabel.textAlignment = .center
        noResultsTextDescriptionLabel.numberOfLines = 0
        
        let task = DispatchWorkItem {
            self.collectionView.backgroundView = container
            
            container.addSubviews(noResultsTitleLabel, noResultsTextDescriptionLabel)
            
            noResultsTitleLabel.anchorCenterX(anchorX: container.centerXAnchor)
            noResultsTitleLabel.anchorCenterY(anchorY: container.centerYAnchor)
            
            noResultsTitleLabel.anchor(leading: container.leadingAnchor,
                                       trailing: container.trailingAnchor,
                                       padding: UIEdgeInsets(top: 0,
                                                             left: 0,
                                                             bottom: 0,
                                                             right: 0))
            
            noResultsTextDescriptionLabel.anchor(top: noResultsTitleLabel.bottomAnchor,
                                                 leading: container.leadingAnchor,
                                                 trailing: container.trailingAnchor,
                                                 padding: UIEdgeInsets(top: 8,
                                                                       left: 16,
                                                                       bottom: 0,
                                                                       right: 16),
                                                 size: CGSize(width: container.frame.width - 32,
                                                              height: 60))
        }
        
        self.viewTaskManager = task
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: self.viewTaskManager)
        
    }
    
}
