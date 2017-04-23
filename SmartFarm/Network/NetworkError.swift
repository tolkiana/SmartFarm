//
//  NetworkError.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/20/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case notFound
    case noData
    case badRequest
    case forbidden
    case parse
    case noResponse
    case unknown
    
    init(code: Int) {
        switch code {
        case 400:
            self = .badRequest
        case 401:
            self = .notFound
        case 400:
            self = .forbidden
        default:
            self = .unknown
        }
    }
}
