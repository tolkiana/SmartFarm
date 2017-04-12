//
//  StoreItemTests.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import XCTest
@testable import SmartFarm

class StoreItemTests: XCTestCase {
    
    func test_successfull_initialization() {
        let animalsArray = JSONReader.dictionary(fromJSONfile: "storeItem")["animals"] as! [[String: Any]]
        guard let _ = try? StoreItem(json: animalsArray.first!) else {
            XCTFail("Error thrown")
            return
        }

    }
    
    func test_failed_initialization_due_missing_key() {
        let animalsArray = JSONReader.dictionary(fromJSONfile: "storeItem_missing_keys")["animals"] as! [[String: Any]]
        XCTAssertThrowsError(try StoreItem(json: animalsArray.first!)) { (error) -> Void in
            XCTAssertEqual(error as? SerializationError, .missing)
        }
    }
    
    func test_failed_initialization_due_invalid_key() {
        let animalsArray = JSONReader.dictionary(fromJSONfile: "storeItem_invalid_data")["animals"] as! [[String: Any]]
        XCTAssertThrowsError(try StoreItem(json: animalsArray.first!)) { (error) -> Void in
            XCTAssertEqual(error as? SerializationError, .invalid)
        }

    }
    
}
