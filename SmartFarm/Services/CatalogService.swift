//
//  CatalogService.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct CatalogService {
    typealias Code = String
    
    var categories: [Category]
    var items: [StoreItem]
    
    func category(with: Code) -> Category? {
        return nil
    }
    
    func items(`for` category: Category) -> [StoreItem]? {
        return nil
    }
    
    func item(with: Code) -> StoreItem? {
        return nil
    }
    
    func totalItems(`for` category: Category) -> Int {
        return category.items.count
    }
    
    func totalItems() -> Int {
        return items.count
    }
    
}
