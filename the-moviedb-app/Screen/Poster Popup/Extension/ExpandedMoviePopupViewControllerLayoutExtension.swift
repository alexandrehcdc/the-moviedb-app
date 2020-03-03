//
//  ExpandedMoviePopupViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/24/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension ExpandedMoviePopupViewController {
    
    func setLayout() {
        self.view.addSubviews(posterImageView, dismissButton)
        
        self.posterImageView.frame = CGRect(x: 0,
                                            y: 0,
                                            width: self.view.frame.width / 1.25,
                                            height: (self.view.frame.width / 1.25) * 1.5)
        
        self.posterImageView.center = self.view.center
        
        self.dismissButton.fillSuperView()
    }
    
}
