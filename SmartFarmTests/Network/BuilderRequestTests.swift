//
//  BuilderRequestTests.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/19/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import XCTest
@testable import SmartFarm

class BuilderRequestTests: XCTestCase {
    
    let expectedUrl = "base.url" + "/endpoint"
    let expeectedHeaders = ["key": "value"]
    
    func testGetRequestWithHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.getRequest(endPoint: "/endpoint", headers: expeectedHeaders)!
        let header = request.allHTTPHeaderFields?["key"]
        
        XCTAssertNotNil(header)
        XCTAssert(request.httpMethod! == HTTPMethod.get.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)
    }
    
    func testGetRequestWithNoHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.getRequest(endPoint: "/endpoint")!
        let header = request.allHTTPHeaderFields?["key"]
        
        XCTAssertNil(header)
        XCTAssert(request.httpMethod! == HTTPMethod.get.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)
    }
    
    func testPostRequestWithHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.postRequest(endPoint: "/endpoint", parameters: ["param": "value"], headers: expeectedHeaders)!
        let header = request.allHTTPHeaderFields?["key"]
        
        XCTAssertNotNil(header)
        XCTAssertNotNil(request.httpBody)
        XCTAssert(request.httpMethod! == HTTPMethod.post.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)

    }
    
    func testPostRequestWithNoHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.postRequest(endPoint: "/endpoint", parameters: ["param": "value"])!
        let header = request.allHTTPHeaderFields?["key"]
        
        XCTAssertNil(header)
        XCTAssertNotNil(request.httpBody)
        XCTAssert(request.httpMethod! == HTTPMethod.post.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)

    }
    
}
