//
//  GetGenreUseCase.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct GetGenreUseCase {

    typealias GenreObjectsTypedCallback = ((BaseCallback<[GenreEntity]>) -> Void)
    typealias GenreResponseType         = BaseCallback<GenreResponse>
    
    func fetchMovieGenres(_ responseCallback: @escaping GenreObjectsTypedCallback) {
        
        guard let url = URLBuilder.getGenreURL() else { return }
        
        GenericRequest.get(url: url) { (response: GenreResponseType) in
            
            response.onSuccess { (genreResponse) in
                let mappedGenres = GenreConverter.fromResponseToEntities(genreResponse)
                
                responseCallback(BaseCallback.success(mappedGenres))
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
