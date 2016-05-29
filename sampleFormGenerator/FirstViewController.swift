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
    
    let cellTextFieldIdentifier = "TextFieldTableViewCellIdentifier"
    let cellTextFieldXib        = "TextFieldTableViewCell"
    let cellSwitchIdentifier    = "SwitchTableViewCellIdentifier"
    let cellSwitchXib           = "SwitchTableViewCell"
    
    var contentJson :JSON?
    
    enum typeForm: NSInteger {
        case textFieldDefaultTypeForm = 1
        case textFieldMailTypeForm
        case textFieldNumberTypeForm
        case switchTypeForm
        case pickerTypeForm
        case firstForm
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func nibRegister() {
        tableView?.registerNib(UINib(nibName: cellTextFieldXib, bundle: nil), forCellReuseIdentifier: cellTextFieldIdentifier)
        tableView?.registerNib(UINib(nibName: cellSwitchXib, bundle: nil), forCellReuseIdentifier: cellSwitchIdentifier)
    }
    
    // MARK: - TableView delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.contentJson?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTextFieldIdentifier, forIndexPath: indexPath) as! TextFieldTableViewCell
        cell.cellLabel?.text = self.contentJson![indexPath.row]["label"].stringValue
        cell.contentTextField.placeholder = self.contentJson![indexPath.row]["content"].stringValue
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }
}
