//
//  ResultType.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/20/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

enum ResultType<T> {
    case success(T)
    case failure(Error)
}
