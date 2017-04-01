//
//  CheckoutFixture.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/31/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

@objc(CheckoutFixture)
class CheckoutFixture: NSObject {
    var success = true
    
    func productsInCatalog() -> String {
        return "0"
    }
    
    func productsInCart() -> String {
        return "0"
    }
    
    func cartTotalAmount() -> String {
        return "0.0"
    }

}
