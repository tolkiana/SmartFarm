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
    func totalItems(inCategory category: Category) -> Int
    func totalItems() -> Int
}
