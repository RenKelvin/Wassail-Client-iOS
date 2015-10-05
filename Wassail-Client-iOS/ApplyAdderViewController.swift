//
//  ApplyAdderViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyAdderViewController: GAITrackedViewController, UIAlertViewDelegate, UIActionSheetDelegate {
    
    let info: ApplyAdderInfo = ApplyAdderInfo.instance
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var footerViewLabel: UILabel?
    
    @IBOutlet var yearButton: UIButton?
    @IBOutlet var seasonButton: UIButton?
    @IBOutlet var degreeButton: UIButton?
    @IBOutlet var fieldButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //
        self.reloadData()
        
        // GAITrackedViewController name
        self.screenName = "Apply Adder Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        navigationView!.backgroundColor! = UIColor.HLBlue(0)
        
    }
    
    // MARK: -
    
    func reloadData() {
        
        info.reloadData()
        
        self.updateHeader()
        
        self.tableView!.reloadData()
    }
    
    func updateHeader() {
        if (info.year != 0) {
            yearButton!.setTitle("\(info.year)", forState: .Normal)
        }
        
        if (info.season != 0) {
            switch info.season {
            case 1:
                seasonButton!.setTitle("春季", forState: .Normal)
            case 2:
                seasonButton!.setTitle("夏季", forState: .Normal)
            case 3:
                seasonButton!.setTitle("秋季", forState: .Normal)
            case 4:
                seasonButton!.setTitle("冬季", forState: .Normal)
            default:
                ""
            }
        }
        
        if (info.degree != 0) {
            switch info.degree {
            case 1:
                degreeButton!.setTitle("Bachelor", forState: .Normal)
            case 2:
                degreeButton!.setTitle("Master", forState: .Normal)
            case 3:
                degreeButton!.setTitle("Doctor", forState: .Normal)
            default:
                ""
            }
        }
        
        if (info.field != 0) {
            var fieldName: String? = "No Specific Field"

            if (info.degree != 1) {
             fieldName = NSUserDefaults.standardUserDefaults().stringForKey("defaultFieldName")
            }
            else {
                fieldButton!.enabled = false
            }
            
            if (fieldName != nil) {
                fieldButton!.setTitle("\(fieldName!)", forState: .Normal)
            }
        }
        else {
            self.performSegueWithIdentifier("ApplyAdderFieldSelectorSegueIdentifier", sender: "FieldSelectorList")
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func yearButtonClicked() {
        let actionSheet = UIActionSheet(title: "选择入学时间", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil)
        actionSheet.tag = 1
        
        actionSheet.addButtonWithTitle("2015")
        
        actionSheet.showInView(self.view)
    }
    
    @IBAction func seasonButtonClicked() {
        let actionSheet = UIActionSheet(title: "选择入学学期", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil)
        actionSheet.tag = 2
        
        actionSheet.addButtonWithTitle("春季")
        actionSheet.addButtonWithTitle("夏季")
        actionSheet.addButtonWithTitle("秋季")
        actionSheet.addButtonWithTitle("冬季")
        
        actionSheet.showInView(self.view)
    }
    
    @IBAction func degreeButtonClicked() {
        let actionSheet = UIActionSheet(title: "选择目标学位", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil)
        actionSheet.tag = 3
        
        actionSheet.addButtonWithTitle("Bachelor")
        actionSheet.addButtonWithTitle("Master")
        actionSheet.addButtonWithTitle("Doctor")
        
        actionSheet.showInView(self.view)
    }
    
    @IBAction func fieldButtonClicked() {
        self.performSegueWithIdentifier("ApplyAdderFieldSelectorSegueIdentifier", sender: "FieldSelectorList")
    }
    
    @IBAction func doneButtonClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        if (tableView == self.searchDisplayController!.searchResultsTableView) {
            let array = info.getFilteredPrograms(self.searchDisplayController!.searchBar.text!)
            if (array == nil) {
                self.footerViewLabel!.text = NSString(format: "共0个项目") as String
            }
            else {
                self.footerViewLabel!.text = NSString(format: "共%d个项目", array!.count) as String
            }
        }
        else {
            let array = info.getAllPrograms()
            if (array == nil) {
                self.footerViewLabel!.text = NSString(format: "共0个项目") as String
            }
            else {
                self.footerViewLabel!.text = NSString(format: "共%d个项目", array!.count) as String
            }
        }
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        var array: NSArray?
        
        if (tableView == self.searchDisplayController!.searchResultsTableView) {
            array = info.getFilteredPrograms(self.searchDisplayController!.searchBar.text!)
        }
        else {
            array = info.getAllPrograms()
        }
        
        if (array == nil) {
            return 0
        }
        
        return array!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView!.dequeueReusableCellWithIdentifier("ApplyAdderTableViewCellReuseIdentifier", forIndexPath: indexPath) as! ApplyAdderTableViewCell
        
        if (tableView == self.searchDisplayController!.searchResultsTableView) {
            let array = info.getFilteredPrograms(self.searchDisplayController!.searchBar.text!)
            
            if (array == nil) {
                return cell
            }
            
            let program = array!.objectAtIndex(indexPath.row) as! HLProgramInstancePreview
            
            cell.configure(program)
        }
            
        else {
            let array = info.getAllPrograms()
            let program = array!.objectAtIndex(indexPath.row) as! HLProgramInstancePreview
            
            cell.configure(program)
        }
        
        return cell
        
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 64.0
    }
    
    // MARK: - UIActionSheetDelegate
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch actionSheet.tag {
        case 1:
            switch buttonIndex {
            case 0:
                ""
            case 1:
                info.year = 2015
                NSUserDefaults.standardUserDefaults().setInteger(2015, forKey: "defaultYear")
                NSUserDefaults.standardUserDefaults().synchronize()
                yearButton!.setTitle("2015", forState: .Normal)
            default:
                ""
            }
        case 2:
            switch buttonIndex {
            case 0:
                ""
            case 1:
                info.season = 1
                NSUserDefaults.standardUserDefaults().setInteger(1, forKey: "defaultSeason")
                NSUserDefaults.standardUserDefaults().synchronize()
                seasonButton!.setTitle("春季", forState: .Normal)
            case 2:
                info.season = 2
                NSUserDefaults.standardUserDefaults().setInteger(2, forKey: "defaultSeason")
                NSUserDefaults.standardUserDefaults().synchronize()
                seasonButton!.setTitle("夏季", forState: .Normal)
            case 3:
                info.season = 3
                NSUserDefaults.standardUserDefaults().setInteger(3, forKey: "defaultSeason")
                NSUserDefaults.standardUserDefaults().synchronize()
                seasonButton!.setTitle("秋季", forState: .Normal)
            case 4:
                info.season = 4
                NSUserDefaults.standardUserDefaults().setInteger(4, forKey: "defaultSeason")
                NSUserDefaults.standardUserDefaults().synchronize()
                seasonButton!.setTitle("冬季", forState: .Normal)
            default:
                ""
            }
        case 3:
            switch buttonIndex {
            case 0:
                ""
            case 1:
                info.degree = 1
                NSUserDefaults.standardUserDefaults().setInteger(1, forKey: "defaultDegree")
                NSUserDefaults.standardUserDefaults().synchronize()
                degreeButton!.setTitle("Bachelor", forState: .Normal)
                
                fieldButton!.enabled = false
                let fieldName = "No Specific Field"
                fieldButton!.setTitle("\(fieldName)", forState: .Normal)
                
                // let alert = UIAlertView(title: "即将上线", message: "很抱歉，本科申请功能即将上线", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "好的")
                // alert.show()
            case 2:
                info.degree = 2
                NSUserDefaults.standardUserDefaults().setInteger(2, forKey: "defaultDegree")
                NSUserDefaults.standardUserDefaults().synchronize()
                degreeButton!.setTitle("Master", forState: .Normal)
                
                fieldButton!.enabled = true
                let fieldName = NSUserDefaults.standardUserDefaults().stringForKey("defaultFieldName")
                if (fieldName != nil) {
                    fieldButton!.setTitle("\(fieldName!)", forState: .Normal)
                }
            case 3:
                info.degree = 3
                NSUserDefaults.standardUserDefaults().setInteger(3, forKey: "defaultDegree")
                NSUserDefaults.standardUserDefaults().synchronize()
                degreeButton!.setTitle("Doctor", forState: .Normal)
                
                fieldButton!.enabled = true
                let fieldName = NSUserDefaults.standardUserDefaults().stringForKey("defaultFieldName")
                if (fieldName != nil) {
                    fieldButton!.setTitle("\(fieldName!)", forState: .Normal)
                }
            default:
                ""
            }
        default:
            ""
        }
        
        self.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let controller = segue.destinationViewController as UIViewController
        controller.setInfo(sender)
    }
    
}
