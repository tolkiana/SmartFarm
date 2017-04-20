//
//  RequestBuilder.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/15/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct RequestBuilder {
    private var baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getRequest(endPoint: String, headers: [String: String]?) -> URLRequest? {
        return baseRequest(endPoint: endPoint, headers: headers)
    }
    
    func postRequest(endPoint: String, parameters:[String: Any], headers: [String: String]?) -> URLRequest? {
        var request = baseRequest(endPoint: endPoint, headers: headers)
        request?.httpMethod = HTTPMethod.post.rawValue
        request?.httpBody = try? JSONSerialization.data(withJSONObject: parameters,
                                                        options: JSONSerialization.WritingOptions.prettyPrinted)
        return request
    }
    
    private func baseRequest(endPoint: String, headers: [String: String]?) -> URLRequest? {
        guard let url = URL(string: self.baseURL + endPoint) else {
            return nil
        }
        var request = URLRequest(url: url)
        if let headers = headers {
            for header in headers {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        return request
    }
}
