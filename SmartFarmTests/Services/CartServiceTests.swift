//
//  CartServiceTests.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import XCTest

class CartServiceTests: XCTestCase {
    
    let cart = CartService.shared
    
    override func tearDown() {
        cart.clearItems()
    }
    
    func test_getting_all_cart_items() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        
        XCTAssert(cart.cartItems().count == 1)
        XCTAssert(cart.cartItems().first?.storeItem.code == mockStoreItem.code)
    }
    
    func test_getting_total_items() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 3)
        
        XCTAssert(cart.totalItems() == 3)
    }
    
    func test_add_new_store_item() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        
        XCTAssert(cart.totalItems() == 2)
        XCTAssert(cart.cartItems().count == 1)
        XCTAssert(cart.cartItems().first?.storeItem.code == mockStoreItem.code)
    }
    
    func test_add_existing_store_item() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        cart.add(storeItem: mockStoreItem, quantity: 1)
        
        XCTAssert(cart.totalItems() == 3)
        XCTAssert(cart.cartItems().count == 1)
        XCTAssert(cart.cartItems().first?.storeItem.code == mockStoreItem.code)
    }
    
    func test_add_store_item_with_zero_quantity() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 0)
        
        XCTAssert(cart.totalItems() == 0)
        XCTAssert(cart.cartItems().count == 0)
    }
    
    func test_add_existing_store_item_with_zero_quantity() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        cart.add(storeItem: mockStoreItem, quantity: 0)
        
        XCTAssert(cart.totalItems() == 2)
        XCTAssert(cart.cartItems().count == 1)
    }
    
    func test_remove_cart_item() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        let cartItem = cart.cartItems().first!
        cart.remove(cartItem: cartItem)
        
        XCTAssert(cart.totalItems() == 0)
        XCTAssert(cart.cartItems().count == 0)
    }
    
    func test_increment_cart_item() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        let cartItem = cart.cartItems().first!
        cart.increment(cartItem: cartItem)
        
        XCTAssert(cart.totalItems() == 3)
        XCTAssert(cart.cartItems().count == 1)
        XCTAssert(cartItem.storeItem.code == mockStoreItem.code)
    }
    
    func test_decrement_cart_item() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 2)
        let cartItem = cart.cartItems().first!
        cart.decrement(cartItem: cartItem)
        
        XCTAssert(cart.totalItems() == 1)
        XCTAssert(cart.cartItems().count == 1)
        XCTAssert(cartItem.storeItem.code == mockStoreItem.code)
    }
    
    func test_decrement_last_cart_item() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 1)
        let cartItem = cart.cartItems().first!
        cart.decrement(cartItem: cartItem)
        
        XCTAssert(cart.totalItems() == 0)
        XCTAssert(cart.cartItems().count == 0)
    }
    
    func test_clear_items() {
        let mockStoreItem = MockFactory().mockItem
        cart.add(storeItem: mockStoreItem, quantity: 5)
        cart.clearItems()
        
        XCTAssert(cart.totalItems() == 0)
        XCTAssert(cart.cartItems().count == 0)
    }
    
    func test_checkout() {
    
    }
    
}
