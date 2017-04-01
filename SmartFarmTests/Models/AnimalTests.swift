//
//  AnimalTests.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/1/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import XCTest
@testable import SmartFarm

class AnimalTests: XCTestCase {
    
    func testAnimalDescription() {
        let cow = Animal(category: .cow, price: 100.0, weight: 100.0, vaccinated: true)
        XCTAssert(cow.description == AnimalCategory.cow.rawValue, "The description should be the category name")
    }
}
