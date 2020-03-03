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
                        voteCount: object.voteCount,
                        video: object.video,
                        posterPath: object.posterPath,
                        id: object.id,
                        adult: object.adult,
                        backdropPath: object.backdropPath,
                        originalLanguage: object.originalLanguage,
                        originalTitle: object.originalTitle,
                        genreIds: object.genreIds,
                        title: object.title,
                        voteAverage: object.voteAverage,
                        overview: object.overview,
                        releaseDate: object.releaseDate,
                        page: response.page,
                        totalPages: response.totalPages)
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
                        overview: entity.overview,
                        releaseDate: entity.releaseDate,
                        genres: genreList)
    }
    
}
