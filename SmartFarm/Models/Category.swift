//
//  Category.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/1/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

struct Category {
    var code: String
    var name: String
}

extension Category {

    init(json: [String: Any]) throws {
        guard let rawCode = json["code"], let rawName = json["name"] else {
            throw SerializationError.missing
        }
        guard let code = rawCode as? String, let name = rawName as? String else {
            throw SerializationError.invalid
        }
        self.code = code
        self.name = name
    }
}
