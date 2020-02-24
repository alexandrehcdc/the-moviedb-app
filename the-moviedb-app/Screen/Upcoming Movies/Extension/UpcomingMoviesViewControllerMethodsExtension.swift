//
//  UpcomingMoviesViewControllerMethodsExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

extension UpcomingMoviesViewController: UpcomingMoviesViewContract {
    
    func set(countries: [CountryEntity]) {
        self.countryList = countries
        
        self.layPickerView()
    }
    
    func set(genres: [GenreEntity]) { self.availableGenres = genres }
    
    func getGenres() -> [GenreEntity] { self.availableGenres }
    
    func getCountry() -> String { self.pickedCountry }
    
    func showLoader() {
        DispatchQueue.main.async { self.view.showActivityLoader() }
    }
    
    func hideLoader() {
        DispatchQueue.main.async { self.view.hideActivityLoader() }
    }
    
    func set(movies: [MovieDTO]) { self.movies += movies }
    
    func emptyResponse() {
        self.alert(title: AppStrings.emptyResponse.capitalized,
                   message: AppStrings.emptyResponseMessage.capitalized)
    }
    
    func errorFetching() {
        self.alert(title: AppStrings.error.capitalized,
                   message: AppStrings.errorResponseMessage)
    }
    
    func invalidateCurrentMovieSet() {
        self.currentPage   = 1
        self.movies        = []
        
        self.presenter.fetchMovies(page: self.currentPage)
    }
}
