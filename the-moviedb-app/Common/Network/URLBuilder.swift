//
//  URLBuilder.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/21/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct URLBuilder {
    private static let tmdbRoot   = "api.themoviedb.org"
    private static let scheme     = "https"
    private static let moviesPath = "/3/movie"
    private static let apiKey     = "c5850ed73901b8d268d0898a8a9d8bff"
    
    static func grantUpcomingMoviesURL(page: Int) -> URL? {
        var components = URLComponents()
        
        components.scheme     = URLBuilder.scheme
        components.host       = URLBuilder.tmdbRoot
        components.path       = URLBuilder.moviesPath + "/upcoming"
        components.queryItems = [
            URLBuilder.getAPIKeyQueryItem(),
            URLQueryItem(name: "region", value: Locale.current.regionCode),
            URLQueryItem(name: "language", value: Locale.current.languageCode),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        return components.url
    }
    
    private static func getAPIKeyQueryItem() -> URLQueryItem {
        URLQueryItem(name: "api_key", value: URLBuilder.apiKey)
    }
    
}
