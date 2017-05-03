//
//  ItemMapper.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class ItemMapper {
    
    private static let codesMap = [ "cow": "001",
                                    "pig": "002",
                                    "goat": "003",
                                    "horse": "004",
                                    "chicken": "005",
                                    "turkey": "006"]
    
    static func code(forItem item: String) -> String {
        guard let itemCode = codesMap[item] else {
            return ""
        }
        return itemCode
    }
}
