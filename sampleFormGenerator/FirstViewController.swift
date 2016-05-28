//
//  FirstViewController.swift
//  sampleFormGenerator
//
//  Created by julien gimenez on 28/05/2016.
//  Copyright © 2016 julien gimenez. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView?
    let cellIdentifier = "TextFieldTableViewCellIdentifier"
    let cellXib        = "TextFieldTableViewCell"
    var contentJson :JSON?
    
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
