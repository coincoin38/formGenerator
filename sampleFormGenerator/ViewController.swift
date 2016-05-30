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
        self.contentJson = staff
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

