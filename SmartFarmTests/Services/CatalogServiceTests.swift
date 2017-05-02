//
//  CatalogServiceTests.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import XCTest
@testable import SmartFarm

class CatalogServiceTests: XCTestCase {
    
    var mockService: MockCatalogService!
    
    override func setUp() {
        mockService = MockCatalogService()
    }
    
    func test_getting_all_categories() {
        CatalogService.shared.loadData {}
        let categories = CatalogService.shared.allCategories()
        
        XCTAssertNotNil(categories)
    }
    
    func test_getting_all_items() {
        let items = mockService.allCategories()?.flatMap{ $0.items }
        let expectedItems = mockService.allItems()
        
        XCTAssert(expectedItems?.count == items?.count)
    }
    
    func test_get_category_with_code() {
        let rawCategory = JSONReader.array(fromJSONfile: "catalog").first!
        let items = rawCategory["items"] as! [[String: Any]]
        let category = mockService.category(with: "001")
        
        XCTAssert(category?.code == rawCategory["code"] as? String)
        XCTAssert(category?.name == rawCategory["name"] as? String)
        XCTAssert(category?.items.count == items.count)
    }
    
    
    func test_get_item_with_code() {
        let animals = JSONReader.array(fromJSONfile: "catalog").first!["items"] as! [[String: Any]]
        let cow =  animals.first!
        let item = mockService.item(with: "001")
        
        XCTAssert(item?.code == cow["code"] as? String)
        XCTAssert(item?.name == cow["name"] as? String)
        XCTAssert(item?.icon == cow["image"] as? String)
        XCTAssert(item?.price == cow["price"] as? Float)
        XCTAssert(item?.numberAvailable == cow["numberAvailable"] as? Int)
    }
    
    func test_decrement_item() {
        var item = mockService.item(with: "001")!
        let currentQuantity = item.numberAvailable
        mockService.decrement(item: item, quantity: 1)
        item = mockService.item(with: "001")!
        
        XCTAssert(item.numberAvailable == currentQuantity - 1)
    }
    
    func test_decrement_zero_items() {
        var item = mockService.item(with: "001")!
        let currentQuantity = item.numberAvailable
        mockService.decrement(item: item, quantity: 0)
        item = mockService.item(with: "001")!
        
        XCTAssert(item.numberAvailable == currentQuantity)
    }
    
    func test_decrement_current_available_items() {
        var item = mockService.item(with: "001")!
        mockService.decrement(item: item, quantity: 4)
        item = mockService.item(with: "001")!
        
        XCTAssert(item.numberAvailable == 0)
    }
    
    func test_decrement_more_than_current_available_items() {
        var item = mockService.item(with: "001")!
        mockService.decrement(item: item, quantity: 5)
        item = mockService.item(with: "001")!
        
        XCTAssert(item.numberAvailable == 0)
    }
    
    func test_increment_item() {
        var item = mockService.item(with: "002")!
        let currentQuantity = item.numberAvailable
        mockService.increment(item: item, quantity: 1)
        item = mockService.item(with: "002")!
        
        XCTAssert(item.numberAvailable == currentQuantity + 1)
    }
    
    func test_increment_zero_items() {
        var item = mockService.item(with: "002")!
        let currentQuantity = item.numberAvailable
        mockService.increment(item: item, quantity: 0)
        item = mockService.item(with: "002")!
        
        XCTAssert(item.numberAvailable == currentQuantity)
    }
    
    func test_get_total_items_in_animals_category() {
        let category = mockService.category(with: "001")!
        let total = mockService.totalItems(inCategory: category)
        
        XCTAssert(total == 30)
    }
    
    func test_get_total_items_in_vegetables_category() {
        let category = mockService.category(with: "002")!
        let total = mockService.totalItems(inCategory: category)
        
        XCTAssert(total == 15)
    }
    
    func test_get_total_items() {
        let total = mockService.totalItems()
        
        XCTAssert(total == 45)
    }
}
