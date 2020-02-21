//
//  UpcomingMoviesViewController.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

class UpcomingMoviesViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(PosterWithDescriptionCollectionViewCell.self,
                                forCellWithReuseIdentifier: String(describing: PosterWithDescriptionCollectionViewCell.self))
        
    }

}

