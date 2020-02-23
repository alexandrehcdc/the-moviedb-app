//
//  GetConfigurationUseCase.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct GetConfigurationUseCase {
    
    typealias CountriesObjectsTypedCallback = ((BaseCallback<[CountryEntity]>) -> Void)
    typealias CountriesResponseType         = BaseCallback<[CountryResponse]>
    
    func fetchCountries(_ responseCallback: @escaping CountriesObjectsTypedCallback) {
        
        guard let url = URLBuilder.getCountriesURL() else { return }
        
        GenericRequest.get(url: url) { (response: CountriesResponseType) in
            
            response.onSuccess { (countriesResponse) in
                let convertedEntities = countriesResponse.map { ConfigurationConverter.fromResponseToEntity($0) }
                
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
