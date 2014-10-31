//
//  ApplyAdderViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyAdderViewController: GAITrackedViewController, UIActionSheetDelegate {
    
    let info: ApplyAdderInfo = ApplyAdderInfo.instance
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var yearButton: UIButton?
    @IBOutlet var seasonButton: UIButton?
    @IBOutlet var degreeButton: UIButton?
    
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
    
    func reloadData() {
        
        info.reloadData()
        
        self.tableView!.reloadData()
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
    
    @IBAction func doneButtonClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        var array: NSArray?
        
        if (tableView == self.searchDisplayController!.searchResultsTableView) {
            array = info.getFilteredPrograms(self.searchDisplayController!.searchBar.text)
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
        
        let cell = self.tableView!.dequeueReusableCellWithIdentifier("ApplyAdderTableViewCellReuseIdentifier", forIndexPath: indexPath) as ApplyAdderTableViewCell
        
        if (tableView == self.searchDisplayController!.searchResultsTableView) {
            let array = info.getFilteredPrograms(self.searchDisplayController!.searchBar.text)
            
            if (array == nil) {
                return cell
            }
            
            let program = array!.objectAtIndex(indexPath.row) as HLProgramInstancePreview
            
            cell.configure(program)
        }
            
        else {
            let array = info.getAllPrograms()
            let program = array!.objectAtIndex(indexPath.row) as HLProgramInstancePreview
            
            cell.configure(program)
        }
        
        return cell
        
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "正在申请"
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
    
    // MARK: - UIActionSheetDelegate
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch actionSheet.tag {
        case 1:
            switch buttonIndex {
            case 0:
                ""
            case 1:
                info.year = 2015
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
                seasonButton!.setTitle("春季", forState: .Normal)
            case 2:
                info.season = 2
                seasonButton!.setTitle("夏季", forState: .Normal)
            case 3:
                info.season = 3
                seasonButton!.setTitle("秋季", forState: .Normal)
            case 4:
                info.season = 4
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
                degreeButton!.setTitle("Bachelor", forState: .Normal)
            case 2:
                info.degree = 2
                degreeButton!.setTitle("Master", forState: .Normal)
            case 3:
                info.degree = 3
                degreeButton!.setTitle("Doctor", forState: .Normal)
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
        
        var controller = segue.destinationViewController as UIViewController
        controller.setInfo(sender)
    }
    
}
