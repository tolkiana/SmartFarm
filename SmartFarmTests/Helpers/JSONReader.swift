//
//  JSONReader.swift
//  SmartFarm
//
//  Created by Nelida Velazquez on 4/2/17.
//  Copyright © 2017 Tolkiana. All rights reserved.
//

import Foundation

class JSONReader {
    
    func dictionaryForJSON(fileName: String) -> [String: AnyObject] {
        let JSONPath = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json")
        var dictionaryFromServer: [String: AnyObject] = [:]
        do {
            dictionaryFromServer = try JSONSerialization.jsonObject(
                with: NSData(contentsOfFile: JSONPath!)! as Data,
                options: JSONSerialization.ReadingOptions.mutableContainers
                ) as! [String: AnyObject]
        } catch {
            // Do nothing
        }
        return dictionaryFromServer
    }
    
    func arrayForJSON(fileName: String) -> [[String: AnyObject]] {
        let JSONPath = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json")
        var arrayFromServer: [[String: AnyObject]] = []
        do {
            arrayFromServer = try JSONSerialization.jsonObject(
                with: NSData(contentsOfFile: JSONPath!)! as Data,
                options: JSONSerialization.ReadingOptions.mutableContainers
                ) as! [[String: AnyObject]]
        } catch {
            // Do nothing
        }
        return arrayFromServer
    }
}
