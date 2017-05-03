//
//  AddAnimalFixture.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/31/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

@objc(AddAnimalFixture)
class AddAnimalFixture: NSObject {
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
    
    func cartTotalAmount() -> String {
        return "\(cart.totalAmount())"
    }
}
