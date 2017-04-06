//
//  CategoryTests.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import XCTest
@testable import SmartFarm

class CategoryTests: XCTestCase {
    
    func test_successfull_initialization() {
        let categoriesArray = JSONReader.array(fromJSONfile: "category")
        guard let _ = try? Category(json: categoriesArray.first!) else {
            XCTFail("Error thrown")
            return
        }
    }
    
    func test_failed_initialization_due_missing_key() {
        let categoriesArray = JSONReader.array(fromJSONfile: "category_missing_keys")
        XCTAssertThrowsError(try Category(json: categoriesArray.first!)) { (error) -> Void in
            XCTAssertEqual(error as? SerializationError, .missing)
        }
    }
    
    func test_failed_initialization_due_invalid_key() {
        let categoriesArray = JSONReader.array(fromJSONfile: "category_invalid_data")
        XCTAssertThrowsError(try Category(json: categoriesArray.first!)) { (error) -> Void in
            XCTAssertEqual(error as? SerializationError, .invalid)
        }
    }
        
}
