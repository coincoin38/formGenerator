//
//  CellModel.swift
//  sampleFormGenerator
//
//  Created by julien gimenez on 21/05/2016.
//  Copyright © 2016 julien gimenez. All rights reserved.
//

import UIKit

enum TypeForm : Int {
    case textFieldDefaultTypeForm = 1
    case textFieldMailTypeForm
    case textFieldNumberTypeForm
    case switchTypeForm
    case pickerTypeForm
    case firstForm
}

struct Form {
    var type     : TypeForm
    var label    : String
    var content  : String
    var optional : Bool
    var order    : Int
    var hidden   : Bool
    var style    : Int
}
/*
let staff = [
    Person(name: "Alice", role: .Developer),
    Person(name: "Bob", role: .Manager),
    Person(name: "Clark", role: .Architect),
]*/

extension Form {
    var toJSONDict : [NSObject:AnyObject] {
        return ["label":label, "type":type.rawValue]
    }
}
/*
let jsonDict = staff.map { $0.toJSONDict }
let jsonData = try! NSJSONSerialization.dataWithJSONObject(jsonDict, options: [])
let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
*/