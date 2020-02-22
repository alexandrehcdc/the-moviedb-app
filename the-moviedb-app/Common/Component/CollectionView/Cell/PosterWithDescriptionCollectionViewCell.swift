//
//  PosterWithDescriptionCollectionViewCell.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class PosterWithDescriptionCollectionViewCell: UICollectionViewCell {
    
    lazy var activityIndicator: UIActivityIndicatorView! = {
        let indicator = UIActivityIndicatorView(style: .large)
        
        indicator.color = .gray
        
        return indicator
    }()
    
    lazy var posterImageView: UIImageView! = { [unowned self] in
        let imageView = UIImageView()
        
        imageView.contentMode        = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds      = true
        
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor     = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font          = UIFont.helveticaNeueLight(size: 18)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayout()
    }
    
    deinit {
        self.activityIndicator = nil
        self.posterImageView   = nil
        self.descriptionLabel  = nil
    }
    
    private func setupLayout() {
        self.addSubviews(posterImageView, descriptionLabel)
        
        posterImageView.anchor(top: self.topAnchor,
                               leading: self.leadingAnchor,
                               trailing: self.trailingAnchor,
                               padding: UIEdgeInsets(top: 8,
                                                     left: 16,
                                                     bottom: 0,
                                                     right: 16))
        
        descriptionLabel.anchor(top: posterImageView.bottomAnchor,
                                leading: self.leadingAnchor,
                                bottom: self.bottomAnchor,
                                trailing: self.trailingAnchor,
                                padding: UIEdgeInsets(top: 0,
                                                      left: 0,
                                                      bottom: 0,
                                                      right: 0),
                                size: CGSize(width: self.frame.width,
                                             height: 50))
    }
    
    func set(title: String, posterImage: URL?) {
        self.descriptionLabel.text = title
        
        self.posterImageView.addSubview(self.activityIndicator)
        self.activityIndicator.center = self.center
        
        self.posterImageView.showImageWith(path: posterImage,
                                           activityIndicator: self.activityIndicator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
