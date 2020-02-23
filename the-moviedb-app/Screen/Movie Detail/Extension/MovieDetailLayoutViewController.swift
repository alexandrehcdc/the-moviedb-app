//
//  MovieDetailLayoutViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension MovieDetailViewController {
    
    func setLayout() {
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubviews(backgroundPosterImageView,
                              posterImageView,
                              titleLabel,
                              genreLabel,
                              releaseDateLabel,
                              overviewLabel)
        
        let backgroundPosterHeight = self.view.frame.height * 0.3
        
        self.backgroundPosterImageView.anchor(top: self.view.topAnchor,
                                              leading: self.view.leadingAnchor,
                                              trailing: self.view.trailingAnchor,
                                              padding: UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: 0,
                                                                    right: 0),
                                              size: CGSize(width: self.view.frame.width,
                                                           height: backgroundPosterHeight))
        
        self.posterImageView.anchor(top: self.view.topAnchor,
                                    leading: self.view.leadingAnchor,
                                    padding: UIEdgeInsets(top: backgroundPosterHeight / 2,
                                                          left: 16,
                                                          bottom: 0,
                                                          right: 0),
                                    size: CGSize(width: self.view.frame.width/3,
                                                 height: (self.view.frame.width/3) * 1.5))
        
        self.titleLabel.anchor(top: self.backgroundPosterImageView.bottomAnchor,
                               leading: self.posterImageView.trailingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding: UIEdgeInsets(top: 0,
                                                     left: 8,
                                                     bottom: 0,
                                                     right: 0),
                               size: CGSize(width: (self.view.frame.width/2) - 16, height: 40))
        
        self.genreLabel.anchor(top: self.titleLabel.bottomAnchor,
                               leading: self.posterImageView.trailingAnchor,
                               trailing: self.view.trailingAnchor,
                               padding: UIEdgeInsets(top: 0,
                                                     left: 8,
                                                     bottom: 0,
                                                     right: 0))
        
        self.releaseDateLabel.anchor(top: self.genreLabel.bottomAnchor,
                                     leading: self.posterImageView.trailingAnchor,
                                     trailing: self.view.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0,
                                                           left: 8,
                                                           bottom: 0,
                                                           right: 0))
        
        self.overviewLabel.anchor(top: self.posterImageView.bottomAnchor,
                                  leading: self.view.leadingAnchor,
                                  trailing: self.view.trailingAnchor,
                                  padding: UIEdgeInsets(top: 32,
                                                        left: 16,
                                                        bottom: 0,
                                                        right: 16))
    }
    
}
