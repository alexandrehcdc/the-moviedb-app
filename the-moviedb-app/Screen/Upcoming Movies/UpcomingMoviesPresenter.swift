//
//  UpcomingMoviesPresenter.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct UpcomingMoviesPresenter: UpcomingMoviesPresenterContract {
    
    private unowned let view: UpcomingMoviesViewContract
    private let getMovieUseCase: GetMovieUseCase
    private let getGenreUseCase: GetGenreUseCase
    
    init(view: UpcomingMoviesViewContract) {
        self.view            = view
        self.getMovieUseCase = InjectionUseCase.provideGetMovieUseCase()
        self.getGenreUseCase = InjectionUseCase.provideGetGenreUseCase()
    }
    
    func fetchGenres() {
        self.view.showLoader()
        
        self.getGenreUseCase.fetchMovieGenres { (response) in
            self.view.hideLoader()
            
            response.onSuccess { (genreEntities) in
                self.view.set(genres: genreEntities)
                self.fetchMovies(page: 1)
            }
            
            response.onEmptyData {
                self.fetchMovies(page: 1)
            }
            
            response.onFailed { (err) in
                self.view.errorFetching()
            }
        }
    }
    
    func fetchMovies(page: Int) {
        self.view.showLoader()
        
        self.getMovieUseCase.fetchUpcomingMovies(page: page) { response in
            self.view.hideLoader()
            
            response.onSuccess { (entities) in
                let mappedMovies = entities.map {
                    MovieConverter.fromEntityToDTO($0, genres: self.view.getGenres(), posterSize: 200)
                }
                
                self.view.set(movies: mappedMovies)
            }
            
            response.onEmptyData {
                self.view.emptyMoviesResponse()
            }
            
            response.onFailed { (_) in
                self.view.errorFetching()
            }
        }
    }
    
}
