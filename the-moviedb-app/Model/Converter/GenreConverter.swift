//
//  GenreConverter.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct GenreConverter {
    
    static func fromResponseToEntities(_ response: GenreResponse) -> [GenreEntity] {
        response.genres.map { GenreEntity(id: $0.id, name: $0.name) }
    }
    
}
