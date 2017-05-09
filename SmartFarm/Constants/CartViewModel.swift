//
//  CartViewModel.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/7/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct CartViewModel {
    private let cart = CartService.shared
    var updateHanlder: (() -> Void)?
    
    func numberOfItems() -> Int {
        return cart.cartItems().count
    }
    
    func itemViewModel(`for` indexPath: IndexPath) -> CartItemViewModel {
        let item = cart.cartItems()[indexPath.row]
        return CartItemViewModel(cartItem: item, handler: updateHanlder)
    }
    
    func removeItem(at indexPath: IndexPath) {
        let item = cart.cartItems()[indexPath.row]
        cart.remove(cartItem: item)
    }
}
