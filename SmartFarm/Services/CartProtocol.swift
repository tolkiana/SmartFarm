//
//  CartProtocol.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/30/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

protocol CartProtocol {
    func cartItems() -> [CartItem]
    func totalItems() -> Int
    func add(storeItem: StoreItem, quantity: Int)
    func remove(cartItem: CartItem)
    func increment(cartItem: CartItem)
    func decrement(cartItem: CartItem)
    func checkout(completion: () -> Void)
}
