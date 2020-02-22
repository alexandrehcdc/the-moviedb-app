//
//  PosterWithDescriptionCollectionViewCell.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class PosterWithDescriptionCollectionViewCell: UICollectionViewCell {
    
    lazy var posterImageView: UIImageView! = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .orange
        
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel! = {
        let label = UILabel()
        
        label.text          = "Very big movie name cant tell"
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
        self.posterImageView  = nil
        self.descriptionLabel = nil
    }
    
    func setupLayout() {
        self.addSubviews(posterImageView, descriptionLabel)
        
        posterImageView.anchor(top: self.topAnchor,
                               leading: self.leadingAnchor,
                               trailing: self.trailingAnchor,
                               padding: UIEdgeInsets(top: 0,
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
