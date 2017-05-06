//
//  CartItemViewModel.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/6/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct CartItemViewModel {
    var emoji: String
    var name: String
    var quantity: String
    var price: String
    
    init(cartItem: CartItem) {
        self.emoji = cartItem.storeItem.icon
        self.name = cartItem.storeItem.name
        self.quantity = "\(cartItem.quantity)"
        self.price = "\(Float(cartItem.quantity) * cartItem.storeItem.price)"
    }
}
