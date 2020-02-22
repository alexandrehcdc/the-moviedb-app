//
//  UpcomingMoviesViewControllerDelegateExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UpcomingMoviesViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PosterWithDescriptionCollectionViewCell.self),
                                                            for: indexPath) as? PosterWithDescriptionCollectionViewCell else { return UICollectionViewCell() }

        cell.set(title: self.movies[indexPath.row].title, posterImage: "")

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (self.view.frame.width / 2) - 16 , height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // MARK: TODO
    }
}

extension UpcomingMoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.toggleNavigationBarItems()
            return
        }
        
        // MARK: TODO
    }
}

extension UpcomingMoviesViewController: UpcomingMoviesViewContract {
    func showLoader() {
        super.showActivityLoader()
    }
    
    func hideLoader() {
        super.hideActivityLoader()
    }
    
    func set(movies: [MovieDTO]) {
        self.movies = movies
    }
    
    func emptyMoviesResponse() {
        
    }
    
    func errorFetchingMovies() {
        
    }
    
    func showMovieDetails() {
        
    }
}
