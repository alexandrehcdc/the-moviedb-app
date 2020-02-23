//
//  PosterWithDescriptionCollectionViewCell.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class PosterWithDescriptionCollectionViewCell: UICollectionViewCell {
    
    lazy var posterImageView: UIImageView! = { [unowned self] in
        let imageView = UIImageView()
        
        imageView.contentMode        = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds      = true
        
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .label
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 20)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var genreLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .secondaryLabel
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 16)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    lazy var releaseDateLabel: UILabel! = {
        let label = UILabel()
        
        label.textColor                 = .secondaryLabel
        label.textAlignment             = .center
        label.numberOfLines             = 0
        label.font                      = UIFont.helveticaNeueLight(size: 16)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupLayout()
    }
    
    deinit {
        self.posterImageView   = nil
        self.descriptionLabel  = nil
        self.genreLabel        = nil
        self.releaseDateLabel  = nil
    }
    
    private func setupLayout() {
        self.addSubviews(posterImageView,
                         descriptionLabel,
                         genreLabel,
                         releaseDateLabel)
        
        posterImageView.anchor(top: self.topAnchor,
                               leading: self.leadingAnchor,
                               trailing: self.trailingAnchor,
                               padding: UIEdgeInsets(top: 8,
                                                     left: 16,
                                                     bottom: 0,
                                                     right: 16))
        
        descriptionLabel.anchor(top: posterImageView.bottomAnchor,
                                leading: self.leadingAnchor,
                                trailing: self.trailingAnchor,
                                padding: UIEdgeInsets(top: 0,
                                                      left: 2,
                                                      bottom: 0,
                                                      right: 2),
                                size: CGSize(width: self.frame.width,
                                             height: 25))
        
        genreLabel.anchor(top: descriptionLabel.bottomAnchor,
                          leading: self.leadingAnchor,
                          trailing: self.trailingAnchor,
                          padding: UIEdgeInsets(top: 0,
                                                left: 2,
                                                bottom: 0,
                                                right: 2),
                          size: CGSize(width: self.frame.width,
                                       height: 20))
        
        releaseDateLabel.anchor(top: genreLabel.bottomAnchor,
                                leading: self.leadingAnchor,
                                bottom: self.bottomAnchor,
                                trailing: self.trailingAnchor,
                                padding: UIEdgeInsets(top: 0,
                                                      left: 2,
                                                      bottom: 0,
                                                      right: 2),
                                size: CGSize(width: self.frame.width,
                                             height: 15))
        
    }
    
    func set(title: String, posterImage: URL?, releaseDate: String, genres: [String]) {
        self.descriptionLabel.text = title
        self.releaseDateLabel.text = releaseDate
        self.genreLabel.text       = genres.joined(separator: ", ")
        
        self.posterImageView.showImageWith(path: posterImage,
                                           defaultImage: .unavailable200x300)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
