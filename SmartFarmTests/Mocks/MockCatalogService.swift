//
//  MockCatalogService.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/29/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class MockCatalogService: CatalogProtocol {
    
    func allCategories() -> [Category]? {
         return MockFactory().mockCategories
    }
}
