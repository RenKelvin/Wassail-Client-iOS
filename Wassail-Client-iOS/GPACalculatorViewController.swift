//
//  GPACalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/27/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class GPACalculatorViewController: UIViewController {
    
    @IBOutlet var inputTextField: UITextField?
    
    @IBOutlet var keyboardAccessoryView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        inputTextField!.inputAccessoryView = keyboardAccessoryView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    // MARK: - TableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GPACalculatorTableViewCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
    
    // MARK: -
    
    @IBAction func doneButtonTapped() {
        inputTextField!.resignFirstResponder()
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "换算分数"
        default:
            title = ""
        }
        headerView.titleLabel?.text = title
        
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        
//        amount = NSString(string: textField.text).doubleValue
        
//        self.updateNumbers()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
