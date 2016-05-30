//
//  ViewController.swift
//  sampleFormGenerator
//
//  Created by julien gimenez on 21/05/2016.
//  Copyright © 2016 julien gimenez. All rights reserved.
//

import UIKit

class ViewController: FirstViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nibRegister()
        self.contentJson = firstForm
        
        /*
         let jsonDict = staff.map { $0.toJSONDict }
         let jsonData = try! NSJSONSerialization.dataWithJSONObject(jsonDict, options: [])
         let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
         */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

