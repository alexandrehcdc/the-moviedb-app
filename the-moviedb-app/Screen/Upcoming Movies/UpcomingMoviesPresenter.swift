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
    
    init(view: UpcomingMoviesViewContract) {
        self.view            = view
        self.getMovieUseCase = InjectionUseCase.provideGetMovieUseCase()
    }
    
    func fetchMovies() {
        self.view.showLoader()
        
        self.getMovieUseCase.fetchUpcomingMovies(page: 1) { response in
            self.view.hideLoader()
            
            response.onSuccess { (entities) in
                let mappedMovies = entities.map { MovieConverter.fromEntityToDTO($0) }
                
                self.view.set(movies: mappedMovies)
            }
            
            response.onEmptyData {
                self.view.emptyMoviesResponse()
            }
            
            response.onFailed { (_) in
                self.view.errorFetchingMovies()
            }
        }
    }
    
}
