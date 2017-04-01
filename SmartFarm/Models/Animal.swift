//
//  Animal.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/1/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct Animal: StoreItem {
    var category: AnimalCategory
    var price: Float
    var weight: Float
    var vaccinated: Bool
    
    var description: String  {
        return category.rawValue
    }
}
