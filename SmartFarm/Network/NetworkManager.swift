//
//  NetworkManager.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/14/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static func execute(request: URLRequest, completion: (ResultType<[String: Any]>) -> Void) {
        let tastk = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                return completion(ResultType.failure(error))
            }
        }
        tastk.resume()
    }
}
