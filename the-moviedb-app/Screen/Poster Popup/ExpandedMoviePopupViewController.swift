//
//  ExpandedMoviePopupViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/24/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class ExpandedMoviePopupViewController: UIViewController {

    var image: UIImage! {
        didSet {
            self.posterImageView.image = self.image
        }
    }
    
    lazy var dismissButton: UIButton! = {
        let button = UIButton()
        
        button.addTarget(self, action: #selector(dismissButtonDidPress), for: .touchUpInside)
        
        return button
    }()
    
    lazy var posterImageView: UIImageView! = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds      = true
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
        self.setLayout()
    }
    
    deinit {
        self.posterImageView = nil
    }
    
    @objc func dismissButtonDidPress(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
