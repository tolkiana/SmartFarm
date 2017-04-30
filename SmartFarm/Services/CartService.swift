//
//  CartService.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class CartService: CartProtocol {
    
    private var items: [CartItem] = []
    
    // MARK: - Singleton
    
    static let shared = CartService()
    private init() {}
    
    // MARK - Protocol Implementation

    func cartItems() -> [CartItem] {
        return items
    }
    
    func totalItems() -> Int {
        return items.count
    }
    
    func add(storeItem: StoreItem, quantity: Int) {
    
    }
    
    func remove(cartItem: CartItem) {
    
    }
    
    func increment(cartItem: CartItem) {
    
    }
    
    func decrement(cartItem: CartItem) {
    
    }
    
    func checkout(completion: () -> Void) {
    
    }
}
