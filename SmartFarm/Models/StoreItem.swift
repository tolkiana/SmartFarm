//
//  StoreItem.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/1/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

protocol StoreItem {
    var price: Float { set get }
    var description: String { get }
}
