//
//  CatalogItemViewModel.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/6/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct CatalogItemViewModel {
    var stock: String
    var emoji: String
    var name: String
    var price: String
    
    init(storeItem: StoreItem) {
        self.stock = "\(storeItem.numberAvailable)"
        self.emoji = storeItem.icon
        self.name = storeItem.name
        self.price = "$\(storeItem.price)"
    }
    
    init() {
        self.stock = ""
        self.emoji = ""
        self.name = ""
        self.price = "$-.-"
    }
}
