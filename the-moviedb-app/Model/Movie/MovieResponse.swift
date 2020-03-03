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
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys : String, CodingKey {
        case results,
             dates,
             page,
             totalPages = "total_pages",
             totalResults = "total_results"
    }
    
}

struct MovieResponseBody: Codable {
    let popularity: Float
    let voteCount: Int
    let video: Bool
    let posterPath: String?
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let originalLanguage: String
    let originalTitle: String
    let genreIds: [Int]
    let title: String
    let voteAverage: Float
    let overview: String
    let releaseDate: String
    
    private enum CodingKeys : String, CodingKey {
        case popularity,
             voteCount = "vote_count",
             video,
             posterPath = "poster_path",
             id,
             adult,
             backdropPath = "backdrop_path",
             originalLanguage = "original_language",
             originalTitle = "original_title",
             genreIds = "genre_ids",
             title,
             voteAverage = "vote_average",
             overview,
             releaseDate = "release_date"
    }
}

struct MovieDatesResponse: Codable {
    let maximum: String
    let minimum: String
}
