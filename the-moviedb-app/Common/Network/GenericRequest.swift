//
//  GenericRequest.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct GenericRequest {
    
    typealias GenericResponseCallback<T> = ((BaseCallback<T>) -> Void)
    
    static func get<T> (url: URL, _ responseCallback: @escaping GenericResponseCallback<T>) where T: Codable {
        
        var request = URLRequest(url: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let retrievedData = data ,let responseCode = response as? HTTPURLResponse else { return }
            do {
                switch responseCode.statusCode {
                    case 200...299:
                        if retrievedData.isEmpty {
                            responseCallback(BaseCallback.emptyData())
                        } else {
                            let decodedData = try JSONDecoder().decode(T.self, from: retrievedData)
                            responseCallback(BaseCallback.success(decodedData))
                        }
                    default:
                        responseCallback(BaseCallback.failed())
                }
            } catch let error {
                responseCallback(BaseCallback.failed(error: error))
            }
        }.resume()
    }
    
    static func send<T> (method: HTTPOperationEnum = .POST, url: URL, body: Codable, _ responseCallback: @escaping GenericResponseCallback<T>) where T: Codable {

        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.httpBody   = body.toJSONData()
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let retrievedData = data, let responseCode = response as? HTTPURLResponse else { return }
            do {
                switch responseCode.statusCode {
                    case 200...299:
                        if retrievedData.isEmpty {
                            responseCallback(BaseCallback.emptyData())
                        } else {
                            let decodedData = try JSONDecoder().decode(T.self, from: retrievedData)
                            responseCallback(BaseCallback.success(decodedData))
                        }
                    default:
                        responseCallback(BaseCallback.failed())
                }
            } catch let error {
                responseCallback(BaseCallback.failed(error: error))
            }
        }.resume()
    }
    
}
