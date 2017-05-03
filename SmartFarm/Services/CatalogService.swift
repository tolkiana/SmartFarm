//
//  CatalogService.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class CatalogService: CatalogProtocol {
    typealias Code = String
    private var categories: [Category]?
   
    // MARK: - Singleton
    
    static let shared = CatalogService()
    private init() {}
    
    
    // MARK: - Protocol Implementation
    
    func loadData(completion: () -> Void) {
        categories = MockFactory().mockCategories
        completion()
    }
    
    func allCategories() -> [Category]? {
        return categories
    }
    
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
        guard quantity > 0 else {
            return
        }
        guard var modifiedCategory = category(with: item.categoryCode) else {
            return
        }
        guard let categoryIndex = categories?.index(where: {$0.code == item.categoryCode}) else {
            return
        }
        guard let itemIndex = modifiedCategory.items.index(where: {$0.code == item.code}) else {
            return
        }
        guard var modifiedItem = self.item(with: item.code) else {
            return
        }
        guard quantity != modifiedItem.numberAvailable else {
            remove(item: item, at: itemIndex)
            return
        }
        modifiedItem.numberAvailable = modifiedItem.numberAvailable - quantity
        modifiedCategory.items[itemIndex] = modifiedItem
        categories?[categoryIndex] = modifiedCategory
    }
    
    func increment(item: StoreItem, quantity: Int) {
        guard quantity > 0 else {
            return
        }
        guard var modifiedCategory = category(with: item.categoryCode) else {
            return
        }
        guard let categoryIndex = categories?.index(where: {$0.code == item.categoryCode}) else {
            return
        }
        guard let itemIndex = modifiedCategory.items.index(where: {$0.code == item.code}) else {
            add(item: item, quantity: quantity)
            return
        }
        guard var modifiedItem = self.item(with: item.code) else {
            return
        }
        modifiedItem.numberAvailable = modifiedItem.numberAvailable + quantity
        modifiedCategory.items[itemIndex] = modifiedItem
        categories?[categoryIndex] = modifiedCategory
    }
    
    func totalItems(inCategory category: Category) -> Int {
        return category.items.map{$0.numberAvailable}.reduce(0, +)
    }
    
    func totalItems(forCategoryCode code: Code) -> Int {
        guard let category = self.category(with: code) else {
            return 0
        }
        return category.items.map{$0.numberAvailable}.reduce(0, +)
    }
    
    func totalItems() -> Int {
        guard let items = allItems() else {
            return 0
        }
        return items.map{$0.numberAvailable}.reduce(0, +)
    }
    
    // MARK: - Private
    
    func remove(item: StoreItem, at index: Int) {
        guard var modifiedCategory = category(with: item.categoryCode) else {
            return
        }
        guard let categoryIndex = categories?.index(where: {$0.code == item.categoryCode}) else {
            return
        }
        modifiedCategory.items.remove(at: index)
        categories?[categoryIndex] = modifiedCategory
    }
    
    func add(item: StoreItem, quantity: Int) {
        guard var modifiedCategory = category(with: item.categoryCode) else {
            return
        }
        guard let categoryIndex = categories?.index(where: {$0.code == item.categoryCode}) else {
            return
        }
        var modifiedItem = item
        modifiedItem.numberAvailable = quantity
        modifiedCategory.items.append(modifiedItem)
        categories?[categoryIndex] = modifiedCategory
    }
}
