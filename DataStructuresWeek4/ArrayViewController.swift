//
//  ArrayViewController.swift
//  DataStructuresWeek4
//
//  Created by Jagmit Chug on 1/05/2016.
//  Copyright © 2016 Shweta Chug. All rights reserved.
//

import UIKit

class ArrayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
  
  
  @IBOutlet weak var txtInput: UITextField!
  
  @IBOutlet weak var TableView: UITableView!
  
  
  
  var array: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    array = [String] ()
  }
  
  //MARK: UITableViewDataSources
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   // guard let array = array else {
    //  return 0
    //}
    return array.count
  }
  
  
  //MARK: UITableDelegate
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  
    guard let cell = tableView.dequeueReusableCellWithIdentifier("ArrayTableViewCell") as? ArrayTableViewCell  else {
    return UITableViewCell()
    }
    
    let value = array[indexPath.row]
    cell.lblDisplay.text = value
    return cell
  }
  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
        return true
  }

  
 
  
  func textFieldDidEndEditing(textField: UITextField) {
    guard txtInput.text?.characters.count  > 0 else{
      return
    }
    
    array.append(txtInput.text!)
   
    TableView.reloadData()
    
    txtInput.text = ""
    
  }

  
}

