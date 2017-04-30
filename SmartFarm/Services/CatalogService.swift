//
//  CatalogService.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/22/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class CatalogService: CatalogProtocol {
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
}
