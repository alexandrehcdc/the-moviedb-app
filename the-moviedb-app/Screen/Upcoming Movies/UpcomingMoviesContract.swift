//
//  UpcomingMoviesContract.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

protocol UpcomingMoviesViewContract: BaseViewContract {
    func set(movies: [MovieDTO])
    func set(genres: [GenreEntity])
    func set(countries: [CountryEntity])
    func getGenres() -> [GenreEntity]
    func getCountry() -> String
    func emptyResponse()
    func errorFetching()
    func invalidateCurrentMovieSet()
}

protocol UpcomingMoviesPresenterContract {
    func fetchGenres()
    func fetchMovies(page: Int)
    func fetchCoutries()
}
