//
//  ConfigurationConverter.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct ConfigurationConverter {
    
    static func fromResponseToEntity(_ response: CountryResponse) -> CountryEntity {
        CountryEntity(isoCode: response.iso_3166_1,
                      englishName: response.english_name)
    }
    
}
