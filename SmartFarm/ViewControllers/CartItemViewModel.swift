//
//  CartItemViewModel.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/6/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct CartItemViewModel {
    private let cart = CartService.shared
    private var item: CartItem
    
    var emoji: String
    var name: String
    var quantity: String
    var price: String
    var stepperValue: Double
    var updateHanlder: (() -> Void)?
    
    init(cartItem: CartItem) {
        self.item = cartItem
        self.emoji = cartItem.storeItem.icon
        self.name = cartItem.storeItem.name
        self.quantity = "quantity: \(cartItem.quantity)"
        self.price = "$\(Float(cartItem.quantity) * cartItem.storeItem.price)"
        self.stepperValue = Double(cartItem.quantity)
    }
    
    init(cartItem: CartItem, handler: (() -> Void)?) {
        self.init(cartItem: cartItem)
        self.updateHanlder = handler
    }
    
    func updateQuantity(value: Double) {
        if Int(value) < item.quantity {
            cart.decrement(cartItem: item)
        } else if Int(value) <= item.storeItem.numberAvailable {
            cart.increment(cartItem: item)
        }
        updateHanlder?()
    }
    
}
