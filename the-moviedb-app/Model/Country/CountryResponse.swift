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
    let english_name: String
}
