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
        guard quantity > 0 else {
            return
        }
        guard let index = items.index(where: {$0.storeItem.code == storeItem.code}) else {
            let newItem = CartItem(storeItem: storeItem, quantity: quantity)
            items.append(newItem)
            return
        }
        var cartItem = items[index]
        cartItem.quantity += quantity
        items[index] = cartItem
        
        CatalogService.shared.decrement(item: storeItem, quantity: quantity)
    }
    
    func remove(cartItem: CartItem) {
        guard let index = items.index(where: {$0.storeItem.code == cartItem.storeItem.code}) else {
            return
        }
        items.remove(at: index)
        
        CatalogService.shared.increment(item: cartItem.storeItem, quantity: cartItem.quantity)
    }
    
    func increment(cartItem: CartItem) {
        add(storeItem: cartItem.storeItem, quantity: 1)
    }
    
    func decrement(cartItem: CartItem) {
        guard cartItem.quantity > 1 else {
            remove(cartItem: cartItem)
            return
        }
        guard let index = items.index(where: {$0.storeItem.code == cartItem.storeItem.code})  else {
            return
        }
        var cartItem = items[index]
        cartItem.quantity -= 1
        items[index] = cartItem
        
        CatalogService.shared.increment(item: cartItem.storeItem, quantity: 1)
    }
    
    func clearItems() {
        items.removeAll()
    }
    
    func checkout(completion: () -> Void) {
    
    }
}
