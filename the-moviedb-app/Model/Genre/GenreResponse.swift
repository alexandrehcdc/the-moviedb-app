//
//  GenreResponse.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct GenreResponse: Codable {
    let genres: [GenreBodyResponse]
}

struct GenreBodyResponse: Codable {
    let id: Int
    let name: String
}
