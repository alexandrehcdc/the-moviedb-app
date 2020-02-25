//
//  MovieDetailViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movie: MovieDTO! {
        didSet {
            self.backgroundPosterImageView.showImageWith(path: self.movie.posterURL)
            self.posterImageView.showImageWith(path: self.movie.posterURL)
            self.titleLabel.text       = self.movie.title
            self.genreLabel.text       = self.movie.genres.joined(separator: ", ")
            self.overviewLabel.text    = self.movie.overview
            self.releaseDateLabel.text = self.movie.releaseDate
        }
    }
    
    lazy var backgroundPosterImageView: UIImageView! = {
        let imageView      = UIImageView()
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))

        imageView.addSubview(blurEffectView)

        blurEffectView.fillSuperView()
        
        return imageView
    }()
    
    lazy var posterImageView: UIImageView! = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds      = true
        
        return imageView
    }()
    
    lazy var posterImageExpandButton: UIButton! = {
        let button = UIButton()
        
        return button
    }()
    
    lazy var titleLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .label
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 20)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var genreLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .secondaryLabel
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 12)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var overviewLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .label
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 14)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var releaseDateLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .secondaryLabel
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 12)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var posterExpansionButton: UIButton! = {
        let button = UIButton()
        let image  = UIImage.expand.withRenderingMode(.alwaysTemplate)
        
        button.setImage(image, for: .normal)
        
        button.imageView?.tintColor = .label
        button.imageEdgeInsets      = UIEdgeInsets(top: 2,
                                                   left: 2,
                                                   bottom: 2,
                                                   right: 2)
        
        button.addTarget(self, action: #selector(expandButtonDidPress), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setLayout()
    }
    
    @objc func expandButtonDidPress(sender: UIButton) {
        self.showPosterModal(image: self.posterImageView.image ?? .unavailable200x300)
    }
    
}
