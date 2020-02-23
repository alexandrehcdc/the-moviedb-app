//
//  AppStrings.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/21/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct AppStrings {

    // MARK: App description strings
    public static let app_version_number = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    public static let app_version_name = localized("app_version_name")
    public static let app_version      = "\(app_version_name) \(String(describing: app_version_number))"
    public static let app_name         = localized("app_name")
    
    // MARK: General strings
    public static let idiom         = localized("idiom")
    public static let cancel        = localized("cancel")
    public static let brazil        = localized("brazil")
    public static let united_states = localized("united_states")
    
    // MARK: Configuration related strings
    public static let pick_region       = localized("pick_region")
    public static let pick_region_title = localized("pick_region_title")
    public static let other_region      = localized("other_region")
    
    // MARK: Movie related strings
    public static let upcoming_movies = localized("upcoming_movies")
    
    // MARK: Localization function
    public static func localized(_ value: String) -> String {
        NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: String(), comment: String())
    }
    
}
