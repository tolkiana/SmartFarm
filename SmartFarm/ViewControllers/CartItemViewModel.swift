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
    var quantityUpdated: (() -> Void)?
    
    init(cartItem: CartItem) {
        self.item = cartItem
        self.emoji = cartItem.storeItem.icon
        self.name = cartItem.storeItem.name
        self.quantity = "quantity: \(cartItem.quantity)"
        self.price = "$\(Float(cartItem.quantity) * cartItem.storeItem.price)"
        self.stepperValue = Double(cartItem.quantity)
    }
    
    func updateQuantity(value: Double) {
        let newQuantity = Int(value)
        if newQuantity < item.quantity {
            cart.decrement(cartItem: item)
        } else if newQuantity <= item.storeItem.numberAvailable {
            cart.increment(cartItem: item)
        }
        quantityUpdated?()
    }
    
}
