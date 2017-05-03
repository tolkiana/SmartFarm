//
//  AddGoatFixture.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/31/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

@objc(AddGoatFixture)
class AddGoatFixture: NSObject {
    let catalog = CatalogService.shared
    let cart = CartService.shared
    
    var product = ""
    var quantity = ""
    
    func productsInCatalog() -> String {
        let code = ItemMapper.code(forItem: product)
        guard let item = catalog.item(with: code) else {
            return ""
        }
        guard let qty = Int(quantity) else {
            return ""
        }
        cart.add(storeItem: item, quantity: qty)
        let total = catalog.totalItems(forCategoryCode: item.categoryCode)
        
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
