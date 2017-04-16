//
//  RequestInfo.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/15/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct RequestInfo {
    var endpoint: String
    var method: HTTPMethod
    var parameters: [String: Any]?
    var headers: [String: String]?
}
