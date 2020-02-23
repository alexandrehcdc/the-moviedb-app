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
    func getGenres() -> [GenreEntity]
    func emptyMoviesResponse()
    func errorFetching()
    func showMovieDetails()
}

protocol UpcomingMoviesPresenterContract {
    func fetchGenres()
    func fetchMovies(page: Int)
}
