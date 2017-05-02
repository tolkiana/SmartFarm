//
//  CatalogProtocol.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/29/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

protocol CatalogProtocol {
    
    typealias Code = String
    
    func loadData(completion: () -> Void)
    func allCategories() -> [Category]?
    func allItems() -> [StoreItem]?
    func category(with code: Code) -> Category?
    func item(with code: Code) -> StoreItem?
    func decrement(item: StoreItem, quantity: Int)
    func increment(item: StoreItem, quantity: Int)
    func totalItems() -> Int
}

extension CatalogProtocol {

    func allItems() -> [StoreItem]? {
        return allCategories()?.flatMap{ $0.items }
    }
    
    func category(with code: Code) -> Category? {
        return allCategories()?.filter { $0.code == code }.first
    }
    
    func item(with code: Code) -> StoreItem? {
        return allItems()?.filter { $0.code == code }.first
    }
    
    func decrement(item: StoreItem, quantity: Int) {
        precondition(quantity <= item.numberAvailable)
    }
    
    func increment(item: StoreItem, quantity: Int) {
        
    }
    
    func totalItems() -> Int {
        guard let items = allItems() else {
            return 0
        }
        return items.count
    }
}
