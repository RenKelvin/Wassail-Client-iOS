//
//  GPACalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/27/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class GPACalculatorViewController: GAITrackedViewController {
    
    let info: GPACalculatorInfo = GPACalculatorInfo.instance
    
    var input: Double = 0
    @IBOutlet var inputTextField: UITextField?
    
    var gpa: Double = 0
    @IBOutlet var gpaLabel: UILabel?
    
    var ranking: Double = 0
    @IBOutlet var rankingLabel: UILabel?
    
    @IBOutlet var keyboardAccessoryView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        inputTextField!.inputAccessoryView = keyboardAccessoryView
        
        let mygpa = info.getMyGPA() as Double?
        if (mygpa != nil) {
            input = mygpa!
            self.updateNumbers()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "GPA Calculator Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let mygpa = info.getMyGPA() as Double?
        
        if (mygpa == nil) {
            inputTextField!.becomeFirstResponder()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func updateViews() {
        inputTextField!.text = NSString(format: "%.2f", input) as String
        
        gpaLabel!.text = NSString(format: "%.2f", gpa) as String
        
        rankingLabel!.text = NSString(format: "恭喜！你的成绩超过了%.1f%%的申请者！", ranking*100) as String
    }
    
    func updateNumbers() {
        
        // GPA
        if (input > 93.0) {
            gpa = 4.0
        }
        else if (input < 60.0) {
            gpa = 0.0
        }
        else {
            let k = 1.0 / 13.0
            let b = -41.0 / 13.0
            gpa = k*input + b
        }
        
        // Ranking
        ranking = (-1.0/30.0)*(gpa-1)*(gpa-14)
        if (ranking < 0.01) {
            ranking = 0.00
        }
        
        self.updateViews()
    }
    
    // MARK: - IBAction
    
    @IBAction func doneButtonTapped() {
        inputTextField!.resignFirstResponder()
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        let headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as! RKTableHeaderView
        
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
        
        input = NSString(string: textField.text!).doubleValue
        textField.text = NSString(format: "%.2f", input) as String
        
        info.setMyGPA(input)
        
        self.updateNumbers()
        
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
