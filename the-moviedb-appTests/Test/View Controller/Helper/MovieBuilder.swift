//
//  MovieBuilder.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/24/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Fakery
import The_MovieDB_App
@testable import The_MovieDB_App

class MovieBuilder {
    
    private let faker = Faker()
    
    var id: Int
    var title: String
    var posterURL: URL!
    var page: Int
    var totalPages: Int
    var overview: String
    var releaseDate: String
    var genres: [String]
    
    init() {
        self.id          = faker.number.randomInt(min: 1, max: 1000000000)
        self.title       = faker.name.name()
        self.posterURL   = URLBuilder.getPosterImage(path: "", imageSize: 200)
        self.page        = 1
        self.totalPages  = 1
        self.overview    = faker.lorem.paragraph()
        self.releaseDate = String(describing: faker.date.between(Date(timeIntervalSince1970: 0), Date()))
        self.genres      = [faker.lorem.word()]
    }
    
    func build(amount: Int) -> [MovieDTO] {
        var movieList: [MovieDTO] = []
        
        for index in 1...amount {
            movieList.append(MovieDTO(id: index,
                                      title: self.title,
                                      posterURL: self.posterURL,
                                      page: self.page,
                                      totalPages: self.totalPages,
                                      overview: self.overview,
                                      releaseDate: self.releaseDate,
                                      genres: self.genres))
        }
        
        return movieList
    }
    
}
