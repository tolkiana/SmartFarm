//
//  CheckoutFailureFixture.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 3/31/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

@objc(CheckoutFailureFixture)
class CheckoutFailureFixture: NSObject {
    
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
