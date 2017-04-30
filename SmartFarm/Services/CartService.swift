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
        return items.map { $0.quantity }.reduce(0, +)
    }
    
    func add(storeItem: StoreItem, quantity: Int) {
        guard var cartItem = items.filter({$0.storeItem.code == storeItem.code}).first else {
            let newItem = CartItem(storeItem: storeItem, quantity: quantity)
            items.append(newItem)
            return
        }
        cartItem.quantity += quantity
    }
    
    func remove(cartItem: CartItem) {
        guard let index = items.index(where: {$0.storeItem.code == cartItem.storeItem.code}) else {
            return
        }
        items.remove(at: index)
    }
    
    func increment(cartItem: CartItem) {
        guard var cartItem = items.filter({$0.storeItem.code == cartItem.storeItem.code}).first else {
            return
        }
        cartItem.quantity += 1
    }
    
    func decrement(cartItem: CartItem) {
        guard var cartItem = items.filter({$0.storeItem.code == cartItem.storeItem.code}).first else {
            return
        }
        if cartItem.quantity <= 1 {
            remove(cartItem: cartItem)
        }
        else {
            cartItem.quantity -= 1
        }
    }
    
    func clearItems() {
        items.removeAll()
    }
    
    func checkout(completion: () -> Void) {
    
    }
}
