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
        self.isSearchActive ? self.filteredMovies.count :self.movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PosterWithDescriptionCollectionViewCell.self),
                                                            for: indexPath) as? PosterWithDescriptionCollectionViewCell else { return UICollectionViewCell() }
        
        if self.isSearchActive {
            cell.set(title: self.filteredMovies[indexPath.row].title,
            posterImage: self.filteredMovies[indexPath.row].posterURL)
        } else {
            cell.set(title: self.movies[indexPath.row].title,
                     posterImage: self.movies[indexPath.row].posterURL)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (self.collectionView.frame.width / 2) - 16
        
        return CGSize(width: cellWidth , height: cellWidth * 1.5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if self.isSearchActive {
            print(self.filteredMovies[indexPath.row])
        } else {
            print(self.movies[indexPath.row])
        }
    }
}

extension UpcomingMoviesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            self.isSearchActive = false
            self.filteredMovies = self.movies
            
            self.toggleNavigationBarItems()
            
            return
        }
        
        self.isSearchActive = true
        self.searchTaskManager?.cancel()
        
        let task = DispatchWorkItem { [unowned self] in
            self.filteredMovies = self.movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        
        self.searchTaskManager = task
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: self.searchTaskManager)
    }
    
}

extension UpcomingMoviesViewController: UpcomingMoviesViewContract {
    func showLoader() {
        DispatchQueue.main.async { self.view.showActivityLoader() }
    }
    
    func hideLoader() {
        DispatchQueue.main.async { self.view.hideActivityLoader() }
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
