//
//  StoreItem.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/1/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct StoreItem {
    var code: String
    var name: String
    var icon: String
    var price: Float
    var categoryCode: String
    var numberAvailable: Int
}

extension StoreItem {
    
    init(json: [String: Any]) throws {
        guard let rawCode = json["code"],
            let rawName = json["name"],
            let rawImage = json["image"],
            let rawPrice = json["price"],
            let rawCategory = json["categoryCode"],
            let rawNumberAvailable = json["numberAvailable"] else {
            throw SerializationError.missing
        }
        
        guard let code = rawCode as? String,
            let name = rawName as? String,
            let icon = rawImage as? String,
            let price = rawPrice as? Float,
            let categoryCode = rawCategory as? String,
            let numberAvailable = rawNumberAvailable as? Int else {
            throw SerializationError.invalid
        }
        self.code = code
        self.name = name
        self.icon = icon
        self.price = price
        self.categoryCode = categoryCode
        self.numberAvailable = numberAvailable
    }
}
