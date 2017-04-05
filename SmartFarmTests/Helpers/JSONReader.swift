//
//  JSONReader.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class JSONReader {
    
    static func dictionary(fromJSONfile fileName: String) -> [String: Any] {
        let JSONPath = Bundle(for: JSONReader.self).path(forResource: fileName, ofType: "json")
        var dictionaryFromServer: [String: Any] = [:]
        do {
            dictionaryFromServer = try JSONSerialization.jsonObject(
                with: NSData(contentsOfFile: JSONPath!)! as Data,
                options: JSONSerialization.ReadingOptions.mutableContainers
                ) as! [String: Any]
        } catch {
            // Do nothing
        }
        return dictionaryFromServer
    }
    
    static func array(fromJSONfile fileName: String) -> [[String: Any]] {
        let JSONPath = Bundle(for: JSONReader.self).path(forResource: fileName, ofType: "json")
        var arrayFromServer: [[String: Any]] = []
        do {
            arrayFromServer = try JSONSerialization.jsonObject(
                with: NSData(contentsOfFile: JSONPath!)! as Data,
                options: JSONSerialization.ReadingOptions.mutableContainers
                ) as! [[String: Any]]
        } catch {
            // Do nothing
        }
        return arrayFromServer
    }
}
