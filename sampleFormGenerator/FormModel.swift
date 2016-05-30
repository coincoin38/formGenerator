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

let firstForm = [
    Form(type: .textFieldDefaultTypeForm, label: "Nom",content: "Stark", optional: false, order: 0, hidden: false, style: 0),
    Form(type: .textFieldDefaultTypeForm, label: "Prénom", content: "Ned", optional: false, order: 1, hidden: false, style: 0),
    Form(type: .textFieldMailTypeForm,    label: "Email", content: "nstark@gmail.com", optional: false, order: 2, hidden: false, style: 0),
    Form(type: .textFieldDefaultTypeForm, label: "Tél.", content: "0600000000", optional: false, order: 3, hidden: false, style: 0),
    Form(type: .textFieldDefaultTypeForm, label: "Anonymous", content: "", optional: false, order: 4, hidden: false, style: 0)
]

extension Form {
    var toJSONDict : [NSObject:AnyObject] {
        return ["type":type.rawValue,"label":label,"content":content, "optional":optional, "order":order, "hidden":hidden, "style":style   ]
    }
}