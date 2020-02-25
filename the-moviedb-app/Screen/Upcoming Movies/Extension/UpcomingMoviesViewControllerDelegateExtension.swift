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

        self.resetCollectionViewEmptyResults()
        
        if self.isSearchActive {
            if self.filteredMovies.isEmpty {
                self.setCollectionViewEmptyResults()
            }
            
            return self.filteredMovies.count
        }
        
        if self.movies.isEmpty {
            self.setCollectionViewEmptyResults()
        }
        
        return self.movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PosterWithDescriptionCollectionViewCell.self),
                                                            for: indexPath) as? PosterWithDescriptionCollectionViewCell else { return UICollectionViewCell() }
        
        if self.isSearchActive {
            cell.set(title: self.filteredMovies[indexPath.row].title,
                     posterImage: self.filteredMovies[indexPath.row].posterURL,
                     releaseDate: self.filteredMovies[indexPath.row].releaseDate,
                     genres: self.filteredMovies[indexPath.row].genres)
        } else {
            cell.set(title: self.movies[indexPath.row].title,
                     posterImage: self.movies[indexPath.row].posterURL,
                     releaseDate: self.movies[indexPath.row].releaseDate,
                     genres: self.movies[indexPath.row].genres)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (self.collectionView.frame.width / 2) - 16
        
        return CGSize(width: cellWidth , height: cellWidth * 1.9)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        30
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 {
            
            let totalPages = isSearchActive ? self.filteredMovies[indexPath.row].totalPages : self.movies[indexPath.row].totalPages
            
            if self.currentPage < totalPages {
                self.currentPage += 1
                self.presenter.fetchMovies(page: self.currentPage)
                return
            }
            
            return
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let detailsViewController = MovieDetailViewController()
        
        if self.isSearchActive {
            detailsViewController.movie = self.filteredMovies[indexPath.row]
        } else {
            detailsViewController.movie = self.movies[indexPath.row]
        }
        
        self.navigationController?.present(detailsViewController, animated: true)
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

extension UpcomingMoviesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.countryList[row].englishName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickedCountry = self.countryList[row].isoCode
        
        self.invalidateCurrentMovieSet()
        pickerView.removeFromSuperview()
    }
}
