//
//  UpcomingMoviesViewControllerMethodsExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

extension UpcomingMoviesViewController: UpcomingMoviesViewContract {
    func set(genres: [GenreEntity]) {
        self.availableGenres = genres
    }
    
    func getGenres() -> [GenreEntity] {
        self.availableGenres
    }
    
    func showLoader() {
        DispatchQueue.main.async { self.view.showActivityLoader() }
    }
    
    func hideLoader() {
        DispatchQueue.main.async { self.view.hideActivityLoader() }
    }
    
    func set(movies: [MovieDTO]) {
        self.movies += movies
    }
    
    func emptyMoviesResponse() {
        
    }
    
    func errorFetching() {
        
    }
    
    func showMovieDetails() {
        
    }
}
