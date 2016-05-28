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
        tableView?.registerNib(UINib(nibName: cellXib, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        StubsReader.SharedInstance.formFromFile(StubsConstants.kStubFirstForm, object: StubsConstants.kRootFirstForm) { (result) in
            self.contentJson = result
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

