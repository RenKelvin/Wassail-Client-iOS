//
//  ProgramInstanceViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ProgramInstanceViewController: GAITrackedViewController, UIAlertViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var coverImageView: UIImageView?
    @IBOutlet var universityNameLabel: UILabel?
    @IBOutlet var programNameLabel: UILabel?
    
    var programInstanceId: NSNumber?
    var data: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reload data
        self.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "Program Instance Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    // MARK: -
    
    override func setInfo(info: AnyObject?) {
        if (info != nil) {
            //
            self.programInstanceId = info as? NSNumber
        }
    }
    
    func updateView() {
        
        self.updateHeaderView()
        
        self.tableView!.reloadData()
    }
    
    func updateHeaderView() {
        universityNameLabel!.text = self.data!["universityName"].stringValue
        programNameLabel!.text = self.data!["programName"].stringValue
        
        iconImageView!.sd_setImageWithURL(NSURL(string: (self.data!["icon"].stringValue)))
        // coverImageView!.sd_setImageWithURL(NSURL(string: (self.data!["cover"].stringValue)))
    }
    
    func reloadData() {
        
        if (programInstanceId == nil) {
            return
        }
        
        //
        UniversityAccessor.instance.getProgramInstanceInfo(programInstanceId!, getProgramInstanceInfoHandler)
    }
    
    func getProgramInstanceInfoHandler(success: Bool, data: NSDictionary?) {
        if (success) {
            self.data = JSON(data!)
            
            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                self.updateView()
            })
        }
        else {
            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                let alert = UIAlertView(title: "网络错误", message: "网络不给力啊！😢", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "好的")
                alert.show()
            })
        }
    }
    
    // MARK: IBAction
    
    @IBAction func reportButtonClicked() {
        self.performSegueWithIdentifier("ProgramInstanceFeedbackSegueIdentifier", sender: nil)
    }
    
    @IBAction func webpageLinkTapped() {
        
        if (data == nil) {
            return
        }
        else {
            let link = self.data!["webpage"].stringValue as NSString
            self.performSegueWithIdentifier("ProgramInstanceBrowserSegueIdentifier", sender: link)
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        var rows = 0
        
        switch section {
        case 0:
            rows = 1
        case 1:
            rows = 1
        default:
            rows = 0
        }
        
        return rows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProgramInstanceTableViewInfoCellReuseIdentifier", forIndexPath: indexPath) as ProgramInstanceTableViewInfoCell
            
            // Configure the cell
            if (self.data == nil) {
                return cell
            }
            cell.configure(data!)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProgramInstanceTableViewContactCellReuseIdentifier", forIndexPath: indexPath) as ProgramInstanceTableViewContactCell
            
            // Configure the cell
            if (self.data == nil) {
                return cell
            }
            cell.configure(data!)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCellWithIdentifier("ProgramInstanceTableViewRequirementCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
            
            // Configure the cell
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "项目信息"
        case 1:
            title = "联系信息"
        case 2:
            title = "申请要求"
        default:
            title = ""
        }
        
        headerView.titleLabel?.text = title
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height = 0.0
        
        switch indexPath.section {
        case 0:
            height = 188.0
        case 1:
            height = 96.0
        case 2:
            height = 44.0
        default:
            height = 0.0
        }
        
        return CGFloat(height)
    }
    
    // MARK: - UIAlertViewDelegate
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var controller = segue.destinationViewController as UIViewController
        controller.setInfo(sender)
    }
    
}
