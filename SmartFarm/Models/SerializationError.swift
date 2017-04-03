//
//  SerializationError.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}
