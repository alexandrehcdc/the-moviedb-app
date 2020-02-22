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
    func emptyMoviesResponse()
    func errorFetchingMovies()
    func showMovieDetails()
}

protocol UpcomingMoviesPresenterContract {
    func fetchMovies(page: Int)
}
