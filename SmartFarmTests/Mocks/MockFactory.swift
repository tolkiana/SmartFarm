//
//  MockFactory.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/26/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct MockFactory {
    
    var mockCategories: [Category] {
        var categories: [Category] = []
        let rawCategories = JSONReader.array(fromJSONfile: "catalog")
        for rawCategory in rawCategories {
            do {
                let category = try Category(json: rawCategory)
                categories.append(category)
            }
            catch {
                let item = StoreItem(code: "5673", name: "itemMock", icon: "🎷", price: 102.20, numberAvailable: 5)
                let category = Category(code: "som123", name: "mock", items: [item])
                categories.append(category)
            }
        }
        return categories
    }
    
    var mockCategory: Category {
        guard let category = mockCategories.first else {
            let item = StoreItem(code: "9587", name: "itemMock", icon: "🌶", price: 0.5, numberAvailable: 2)
            return Category(code: "chillis", name: "mock", items: [item])
        }
        return category
    }
    
    var mockItems: [StoreItem] {
        return mockCategory.items
    }
    
    var mockItem: StoreItem {
        guard let item = mockItems.first else {
            return StoreItem(code: "4321", name: "itemMock", icon: "🍷", price: 10.0, numberAvailable: 12)
        }
        return item
    }
}
