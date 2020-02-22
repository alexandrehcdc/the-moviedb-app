//
//  MovieResponse.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    let results: [MovieResponseBody]
    let dates: MovieDatesResponse?
    let page: Int
    let total_pages: Int
    let total_results: Int
}

struct MovieResponseBody: Codable {
    let popularity: Float
    let vote_count: Int
    let video: Bool
    let poster_path: String?
    let id: Int
    let adult: Bool
    let backdrop_path: String?
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let title: String
    let vote_average: Float
    let overview: String
    let release_date: String
}

struct MovieDatesResponse: Codable {
    let maximum: String
    let minimum: String
}
