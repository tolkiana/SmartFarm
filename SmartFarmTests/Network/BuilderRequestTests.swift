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
        
        XCTAssert(request.allHTTPHeaderFields! == expeectedHeaders)
        XCTAssert(request.httpMethod! == HTTPMethod.get.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)
    }
    
    func testGetRequestWithNoHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.getRequest(endPoint: "/endpoint")!
        
        XCTAssertNil(request.allHTTPHeaderFields)
        XCTAssert(request.httpMethod! == HTTPMethod.get.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)
    }
    
    func testPostRequestWithHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.postRequest(endPoint: "/endpoint", parameters: ["param": "value"], headers: expeectedHeaders)!
        
        XCTAssert(request.allHTTPHeaderFields! == expeectedHeaders)
        XCTAssertNotNil(request.httpBody)
        XCTAssert(request.httpMethod! == HTTPMethod.post.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)

    }
    
    func testPostRequestWithNoHeaders() {
        let builder = RequestBuilder(baseURL: "base.url")
        let request = builder.postRequest(endPoint: "/endpoint", parameters: ["param": "value"])!
        
        XCTAssert(request.allHTTPHeaderFields!.isEmpty)
        XCTAssertNotNil(request.httpBody)
        XCTAssert(request.httpMethod! == HTTPMethod.post.rawValue)
        XCTAssert(request.url?.absoluteString == expectedUrl)

    }
    
}
