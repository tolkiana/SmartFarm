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
    
    func request(withRequestInfo requestInfo: RequestInfo) -> URLRequest? {
        var request = buildRequest(endPoint: requestInfo.endpoint, headers: requestInfo.headers)
        request?.httpMethod = requestInfo.method.rawValue
        if let parameters = requestInfo.parameters {
            request?.httpBody = try? JSONSerialization.data(withJSONObject: parameters,
                                                            options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        return request
    }
    
    private func buildRequest(endPoint: String, headers: [String: String]?) -> URLRequest? {
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
