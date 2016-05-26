//
//  ViewController.swift
//  sampleFormGenerator
//
//  Created by julien gimenez on 21/05/2016.
//  Copyright © 2016 julien gimenez. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView?
    let cellIdentifier = "TextFieldTableViewCellIdentifier"
    let cellXib        = "TextFieldTableViewCell"
    var contentJson :JSON?
    

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
    
    // MARK: - TableView delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.contentJson?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TextFieldTableViewCell
        cell.cellLabel?.text = self.contentJson![indexPath.row]["label"].stringValue
        cell.contentTextField.placeholder = self.contentJson![indexPath.row]["content"].stringValue
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

}

