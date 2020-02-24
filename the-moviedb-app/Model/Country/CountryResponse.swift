//
//  CountryResponse.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct CountryResponse: Codable {
    let iso_3166_1: String
    let englishName: String
    
    private enum CodingKeys : String, CodingKey {
        case iso_3166_1, englishName = "english_name"
    }
    
}
