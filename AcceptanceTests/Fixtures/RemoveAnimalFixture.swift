//
//  RemoveAnimalFixture.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/31/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

@objc(RemoveAnimalFixture)
class RemoveAnimalFixture: NSObject {
    let catalog = CatalogService.shared
    let cart = CartService.shared
    
    var product = ""
    var quantity = ""
    
    func productsInCatalog() -> String {
        let code = ItemMapper.code(forItem: product)
        guard let cartItem = cart.cartItem(withStoreItemCode: code) else {
            return ""
        }
        cart.remove(cartItem: cartItem)
        let total = catalog.totalItems(forCategoryCode: cartItem.storeItem.categoryCode)
        
        return "\(total)"
    }
    
    func productsInCart() -> String {
        return "\(cart.totalItems())"
    }
    
    func goatsInCatalog() -> String {
        let code = ItemMapper.code(forItem: product)
        guard let goats = catalog.item(with: code) else {
            return "0"
        }
        return "\(goats.numberAvailable)"
    }
    
    func cartTotalAmount() -> String {
        return "\(cart.totalAmount())"
    }
}
