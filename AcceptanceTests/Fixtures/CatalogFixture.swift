//
//  CatalogFixture.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

@objc(CatalogFixture)
class CatalogFixture: NSObject {
    var animal = ""
    let catalog = CatalogService.shared
    
    
    func price() -> String {
        catalog.loadData {}
        let code = ItemMapper.code(forItem: animal)
        guard let item = catalog.item(with: code) else {
            return ""
        }
        return "\(item.price)"
    }
    
    func quantity() -> String {
        catalog.loadData {}
        let code = ItemMapper.code(forItem: animal)
        guard let item = catalog.item(with: code) else {
            return ""
        }
        return "\(item.numberAvailable)"
    }
    
}
