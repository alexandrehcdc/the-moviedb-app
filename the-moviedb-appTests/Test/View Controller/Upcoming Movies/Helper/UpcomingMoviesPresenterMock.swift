//
//  UpcomingMoviesPresenterMock.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import the_moviedb_app
@testable import the_moviedb_app

class UpcomingMoviesPresenterMock: UpcomingMoviesPresenterContract {
    
    var fetchGenresWasCalled    = false
    var fetchMoviesWasCalled    = false
    var fetchCountriesWasCalled = false
    
    func fetchGenres() {
        self.fetchGenresWasCalled = true
    }
    
    func fetchMovies(page: Int) {
        self.fetchMoviesWasCalled = true
    }
    
    func fetchCoutries() {
        self.fetchCountriesWasCalled = true
    }
    
}
