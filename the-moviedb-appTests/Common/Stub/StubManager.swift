//
//  StubManager.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import OHHTTPStubs
@testable import the_moviedb_app

struct StubManager {
    
    private static let upcomingMoviesFilePath = "Files/UpcomingMovies.json"
    private static let countriesFilePath      = "Files/Countries.json"
    private static let posterImageFilePath    = "Files/Poster.jpg"
    private static let genreFilePath          = "Files/Genres.json"
    
    private static let defaultHealders = ["content-type": "application/json;charset=utf-8"]
    
    static func setUp() {
        
        // MARK: Upcoming movies stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.grantUpcomingMoviesURL(page: 1, region: "US")
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: upcomingMoviesFilePath,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Countries stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getCountriesURL()
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: countriesFilePath,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Poster image stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getPosterImage(path: "", imageSize: 200)
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: posterImageFilePath,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Genres stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getGenreURL()
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: genreFilePath,
                                statusCode: 200,
                                headers: defaultHealders)
        }
    }
    
    static func removeStubs() {
        OHHTTPStubs.removeAllStubs()
    }
}
