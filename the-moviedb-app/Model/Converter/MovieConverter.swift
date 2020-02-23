//
//  MovieConverter.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct MovieConverter {
    
    static func fromResponseToEntities(_ response: MovieResponse) -> [MovieEntity] {
        response.results.map { object -> MovieEntity in
            MovieEntity(popularity: object.popularity,
                        voteCount: object.vote_count,
                        video: object.video,
                        posterPath: object.poster_path,
                        id: object.id,
                        adult: object.adult,
                        backdropPath: object.backdrop_path,
                        originalLanguage: object.original_language,
                        originalTitle: object.original_title,
                        genreIds: object.genre_ids,
                        title: object.title,
                        voteAverage: object.vote_average,
                        overview: object.overview,
                        releaseDate: object.release_date,
                        page: response.page,
                        totalPages: response.total_pages)
        }
    }
    
    static func fromEntityToDTO(_ entity: MovieEntity, genres: [GenreEntity], posterSize: Int) -> MovieDTO {
        
        var genreList: [String] = []
        
        for id in entity.genreIds {
            for genre in genres {
                if id == genre.id { genreList.append(genre.name)}
            }
        }
        
        return MovieDTO(id: entity.id,
                        title: entity.title,
                        posterURL: URLBuilder.getPosterImage(path: entity.posterPath ?? entity.backdropPath ?? "",
                                                             imageSize: posterSize),
                        page: entity.page,
                        totalPages: entity.totalPages,
                        releaseDate: entity.releaseDate,
                        genres: genreList)
    }
    
}
