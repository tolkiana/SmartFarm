//
//  Category.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/1/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct Category {
    var code: String
    var name: String
    var items: [StoreItem]
}

extension Category {

    init(json: [String: Any]) throws {
        guard let rawCode = json["code"],
            let rawName = json["name"],
            let rawItems = json["items"] else {
            throw SerializationError.missing
        }
        guard let code = rawCode as? String,
            let name = rawName as? String,
            let jsonItems = rawItems as? [[String: Any]] else {
            throw SerializationError.invalid
        }
        
        var items: [StoreItem] = []
        for jsonItem in jsonItems {
            do {
                try items.append(StoreItem(json: jsonItem))
            }
            catch {
                throw error
            }
        }
        self.code = code
        self.name = name
        self.items = items
    }
}
