//
//  NetworkManager.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/14/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static func execute(request: URLRequest, completion: @escaping (ResultType<[String: Any]>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(ResultType.failure(error!))
                return
            }
            guard let HTTPResponse = response as? HTTPURLResponse else {
                completion(ResultType.failure(NetworkError.noResponse))
                return
            }
            guard HTTPResponse.statusCode >= 200 && HTTPResponse.statusCode < 300 else {
                completion(ResultType.failure(NetworkError(code: HTTPResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(ResultType.failure(NetworkError.noData))
                return
            }
            guard let json = serialize(data: data) else {
                completion(ResultType.failure(NetworkError.serialization))
                return
            }
            completion(ResultType.success(json))
        }
        task.resume()
    }
    
    // MARK: Private
    
    private static func serialize(data: Data) -> [String: Any]? {
        let raw = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        guard let json = raw as? [String: Any] else {
            return nil
        }
        return json
    }
}
