//
//  FirstViewController.swift
//  sampleFormGenerator
//
//  Created by julien gimenez on 28/05/2016.
//  Copyright © 2016 julien gimenez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    @IBOutlet weak var tableView: UITableView?
    
    let cellTextFieldIdentifier = "TextFieldTableViewCellIdentifier"
    let cellTextFieldXib        = "TextFieldTableViewCell"
    let cellSwitchIdentifier    = "SwitchTableViewCellIdentifier"
    let cellSwitchXib           = "SwitchTableViewCell"
    
    let nextField = [0:1, 1:2, 2:3, 3:4, 4:5, 5:6]
    
    var contentJson : Array<Form>?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func nibRegister() {
        tableView?.registerNib(UINib(nibName: cellTextFieldXib, bundle: nil), forCellReuseIdentifier: cellTextFieldIdentifier)
        tableView?.registerNib(UINib(nibName: cellSwitchXib, bundle: nil), forCellReuseIdentifier: cellSwitchIdentifier)
    }
    
    // MARK: - TableView delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentJson!.count
   }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTextFieldIdentifier, forIndexPath: indexPath) as! TextFieldTableViewCell
        cell.setDataForCell(contentJson![indexPath.row],tag:indexPath.row,textFieldDelegate:self)

        return cell
    }
    
    // MARK: - TextField delegate

    func textFieldDidEndEditing(textField: UITextField) {
        setNewContentWithTag(textField.tag, text: textField.text!)
    }

    func setNewContentWithTag(tag:Int,text:String){
        contentJson![tag].content = text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Consult our dictionary to find the next field
        if let nextTag = nextField[textField.tag] {
            if let nextResponder = textField.superview?.viewWithTag(nextTag) {
                // Have the next field become the first responder
                nextResponder.becomeFirstResponder()
            }
        }
        // Return false here to avoid Next/Return key doing anything
        return false
    }
}
