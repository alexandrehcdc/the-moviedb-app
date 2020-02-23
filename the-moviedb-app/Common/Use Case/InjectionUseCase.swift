//
//  InjectionUseCase.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct InjectionUseCase {
    
    public static func provideGetMovieUseCase() -> GetMovieUseCase {
        GetMovieUseCase()
    }
    
    public static func provideGetGenreUseCase() -> GetGenreUseCase {
        GetGenreUseCase()
    }
    
}
