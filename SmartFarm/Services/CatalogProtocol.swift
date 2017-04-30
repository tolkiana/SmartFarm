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
    func category(with: Code) -> Category?
    func item(with: Code) -> StoreItem?
    func totalItems() -> Int
}

extension CatalogProtocol {

    func allItems() -> [StoreItem]? {
        return nil
    }
    
    func category(with: Code) -> Category? {
        return nil
    }
    
    func item(with: Code) -> StoreItem? {
        return nil
    }
    
    func totalItems() -> Int {
        return 0
    }
}
