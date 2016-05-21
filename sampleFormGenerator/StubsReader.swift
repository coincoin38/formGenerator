//
//  stubsReader.swift
//  sampleFormGenerator
//
//  Created by julien gimenez on 21/05/2016.
//  Copyright © 2016 julien gimenez. All rights reserved.
//

import UIKit
import SwiftyJSON

class StubsReader: NSObject {

    static let SharedInstance = StubsReader()

    func formFromFile(fileName: String, object: String, completion: (result: JSON) -> Void) {
        
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: stubsConstants.kExtensionJson)
        let dataJson = NSData(contentsOfFile: path!)
        let json = JSON(data: dataJson!)
        completion(result: json[object])
    }
}
