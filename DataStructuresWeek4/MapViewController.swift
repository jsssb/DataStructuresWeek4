//
//  MapViewController.swift
//  DataStructuresWeek4
//
//  Created by Jagmit Chug on 1/05/2016.
//  Copyright © 2016 Shweta Chug. All rights reserved.
//


import UIKit

class MapViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate {
  
 
  //MARk: Outlets
  
  
  @IBOutlet weak var txtKey: UITextField!
  
  
  @IBOutlet weak var txtValue: UITextField!
  
  
  @IBOutlet weak var tableView: UITableView!
  
  var dataMap: [String: String]?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataMap = [String: String]()
   
  
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MapViewController.keyboardWillShow(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    
    
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MapViewController.keyboardWillHide(_:)), name: UIKeyboardWillChangeFrameNotification, object: nil)
    tableView.delegate = self
 tableView.dataSource = self

  }
  
  func keyboardWillShow(notification: NSNotification) {
    txtKey.backgroundColor = UIColor(
      red:1.0,
      green:0.0,
      blue:0.0,
      alpha:1.0)
    txtValue.backgroundColor = UIColor(
      red:1.0,
      green:0.0,
      blue:0.0,
      alpha:1.0)
  }
  
  func keyboardWillHide(notification: NSNotification) {
    txtKey.backgroundColor = UIColor(
      red:0.0,
      green:0.0,
      blue:1.0,
      alpha:1.0)
    txtValue.backgroundColor = UIColor(
      red:0.0,
      green:0.0,
      blue:1.0,
      alpha:1.0)
  }
  //MARK: UITableViewDataSources
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let dataMap = dataMap else {
      return 0
    }
    return dataMap.keys.count
  }
  
  //MARK: UITableDelegate
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let dataMap = dataMap else {
      return UITableViewCell()
    }
    guard let cell = tableView.dequeueReusableCellWithIdentifier("MapTableViewCell", forIndexPath: indexPath) as? MapTableViewCell else {
      return UITableViewCell()
    }
    
    
   // let key = Array(dataMap.keys[indexPath.row])
    let key = Array(dataMap.keys)[indexPath.row]
    let value = dataMap[key]
    cell.lblKey.text = key
    cell.lblValue.text = value
    return cell
  }
  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    guard txtKey.text?.characters.count  > 0 else{
      return
    }
    
    guard txtValue.text?.characters.count  > 0 else{
      return
    }
    
   // dataMap?.append[[txtKey.text!: txtValue.text!]]()
    dataMap?.updateValue(txtKey.text!, forKey: txtValue.text!)
    //dataMap?[txtKey.text!] = txtValue.text!
    tableView.reloadData()
    
    txtKey.text = ""
    txtValue.text = ""
  }
  

  
}
