//
//  MovieDTO.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct MovieDTO {
    let id: Int
    let title: String
    let posterURL: URL?
    let page: Int
    let totalPages: Int
    let overview: String
    let releaseDate: String
    let genres: [String]
}
