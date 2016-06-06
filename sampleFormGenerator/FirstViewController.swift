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
       
        let cell = setTextFieldCell(tableView, cellForRowAtIndexPath: indexPath)
        return cell
    }
    
    // MARK: - Cells content
    
    func setTextFieldCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TextFieldTableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTextFieldIdentifier, forIndexPath: indexPath) as! TextFieldTableViewCell
        cell.setDataForCell(contentJson![indexPath.row],tag:indexPath.row,textFieldDelegate:self)
        cell.tag = indexPath.row
        return cell
    }
    
    // MARK: - TextField delegate

    func textFieldDidEndEditing(textField: UITextField) {
        setNewContentWithTag(textField.tag, text: textField.text!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        setNextCellWithTextField(textField)
        return false
    }
    
    // MARK: - Textfields content & navigation

    func setNewContentWithTag(tag:Int,text:String){
        contentJson![tag].content = text
    }
    
    func setNextCellWithTextField(textField: UITextField){
        
        if ((textField.superview?.superview?.isKindOfClass(TextFieldTableViewCell)) != nil){
            
            let currentCell: TextFieldTableViewCell = (textField.superview?.superview as? TextFieldTableViewCell)!
            let currentIndexPath: NSIndexPath = tableView!.indexPathForCell(currentCell)!
            
            if currentIndexPath.row < self.contentJson!.count-1 {
                let nextIndexPath: NSIndexPath = NSIndexPath (forRow: currentIndexPath.row+1, inSection: currentIndexPath.section)
                let nextCell: TextFieldTableViewCell = (tableView?.cellForRowAtIndexPath(nextIndexPath) as? TextFieldTableViewCell)!
                nextCell.contentTextField.becomeFirstResponder()
            }
        }
    }
}
