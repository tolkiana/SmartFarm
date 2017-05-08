//
//  CatalogViewModel.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 5/7/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct CatalogViewModel {
    private let catalog = CatalogService.shared
    private let cart = CartService.shared
    
    init() {
        catalog.loadData {}
    }
    
    var numberOfCategories: Int {
        guard let number = catalog.allCategories()?.count else {
            return 0
        }
        return number
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        guard let category = catalog.allCategories()?[section] else {
            return 0
        }
        return category.items.count
    }
    
    func itemViewModel(forIndexPath indexPath: IndexPath) -> CatalogItemViewModel {
        guard let category = catalog.allCategories()?[indexPath.section] else {
            return CatalogItemViewModel()
        }
        let item = category.items[indexPath.row]
        return CatalogItemViewModel(storeItem: item)
    }
    
    func categoryName(forSection section: Int) -> String {
        guard let category = catalog.allCategories()?[section] else {
            return ""
        }
        return category.name
    }
    
    func addItem(atIndex indexPath: IndexPath) {
        guard let category = catalog.allCategories()?[indexPath.section] else {
            return
        }
        let item = category.items[indexPath.row]
        cart.add(storeItem: item, quantity: 1)
    }
}
