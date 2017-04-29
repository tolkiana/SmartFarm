//
//  CatalogService.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class CatalogService {
    static let shared = CatalogService()
    private init() {}
    
    typealias Code = String
    private var categories: [Category]?
    
    func loadData(completion: @escaping (ResultType<Any>) -> Void) {
        
    }
    
    func allCategories() -> [Category]? {
        return nil
    }
    
    func allItems() -> [StoreItem]? {
        return nil
    }
    
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
        return 0
    }
    
}
