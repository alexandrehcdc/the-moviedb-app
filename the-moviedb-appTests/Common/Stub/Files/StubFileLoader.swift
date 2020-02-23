//
//  StubFileLoader.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct StubFileLoader {
    
    static func loadByFile<T>(fileName: String, fileExtension: String,  bundle: Bundle, castType: T.Type) -> T? where T: Decodable {
        if let path = bundle.path(forResource: fileName, ofType: fileExtension) {
            do {
                let data       = try Data(contentsOf: URL(fileURLWithPath: path),
                                          options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode(castType.self, from: data)
                
                return jsonResult
            } catch  {
                return nil
            }
        }
        return nil
    }
}
