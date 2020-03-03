//
//  GetMovieUseCase.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct GetMovieUseCase {
    
    typealias MovieObjectsTypedCallback = ((BaseCallback<[MovieEntity]>) -> Void)
    typealias MovieResponseType         = BaseCallback<MovieResponse>
    
    func fetchUpcomingMovies(page: Int? = nil, region: String, _ responseCallback: @escaping MovieObjectsTypedCallback) {
        
        guard let url = URLBuilder.grantUpcomingMoviesURL(page: page ?? 1, region: region) else { return }
        
        GenericRequest.get(url: url) { (response: MovieResponseType) in
            
            response.onSuccess { (movieResponse) in
                let convertedEntities = MovieConverter.fromResponseToEntities(movieResponse)
                
                responseCallback(BaseCallback.success(convertedEntities))
            }
            
            response.onEmptyData {
                responseCallback(BaseCallback.emptyData())
            }
            
            response.onFailed { (err) in
                responseCallback(BaseCallback.failed(error: err))
            }
            
        }
        
    }
}
