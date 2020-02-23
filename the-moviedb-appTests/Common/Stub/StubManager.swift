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
    
    private static let upcomingMoviesFilePath = "UpcomingMovies"
    private static let countriesFilePath      = "Countries"
    private static let posterImageFilePath    = "Poster"
    private static let genreFilePath          = "Genres"
    private static let jsonType               = "json"
    private static let jpgType                = "jpg"
    
    private static let defaultHealders = ["content-type": "application/json;charset=utf-8"]
    
    static func setUp(bundle: Bundle) {
    
        
        // MARK: Upcoming movies stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.grantUpcomingMoviesURL(page: 1, region: "US")
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: bundle.path(forResource: upcomingMoviesFilePath, ofType: jsonType) ?? "",
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Countries stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getCountriesURL()
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: bundle.path(forResource: countriesFilePath, ofType: jsonType) ?? "",
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Poster image stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getPosterImage(path: "", imageSize: 200)
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: bundle.path(forResource: posterImageFilePath, ofType: jpgType) ?? "",
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Genres stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getGenreURL()
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: bundle.path(forResource: genreFilePath, ofType: jsonType) ?? "",
                                statusCode: 200,
                                headers: defaultHealders)
        }
    }
    
    static func removeStubs() {
        OHHTTPStubs.removeAllStubs()
    }
}
