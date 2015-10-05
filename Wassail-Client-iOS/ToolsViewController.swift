//
//  ToolsViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit
import QuickLook

class ToolsViewController: GAITrackedViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var tableViewHeaderView: UIView?
    
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var monthLabel: UILabel?
    @IBOutlet var dayLabel: UILabel?
    
    let info: ToolsInfo = ToolsInfo.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "Tools Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        navigationView!.backgroundColor! = UIColor.HLBlue(0)
        
        // Add table header
        self.tableView?.addSubview(self.tableViewHeaderView!)
        
        let width = self.tableView?.superview?.frame.size.width
        self.tableViewHeaderView?.frame.size.width = width!
        self.tableViewHeaderView?.frame.origin.y = -44.0
        
        // Update date
        let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let components = calendar!.components([.Day, .Month], fromDate: NSDate())
        
        let month = components.month as Int
        let day = components.day as Int
        
        monthLabel!.text = NSString(format: "\(month)月") as String
        dayLabel!.text = String(day)
        
        // Force reload
        tableView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    @IBAction func tablewHeaderTapped() {
        self.performSegueWithIdentifier("ToolsArticleSegueIdentifier", sender: "留学时间表")
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        switch section {
        case 0:
            return info.getApplyTools()!.count
        case 1:
            return info.getAbroadTools()!.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToolsTableViewCellReuseIdentifier", forIndexPath: indexPath) as! ToolsTableViewCell
        
        // Configure the cell
        
        let dict: NSDictionary? = info.getTool(indexPath.section, row: indexPath.row)
        
        if (dict == nil) {
            return cell
        }
        
        cell.configure(dict!)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as! RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "申请工具"
        case 1:
            title = "海外生活"
        default:
            title = ""
        }
        
        headerView.titleLabel?.text = title
        
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //
        switch indexPath.section {
        case 0:
            switch indexPath.row-1 {
            case -2:
                self.performSegueWithIdentifier("ToolsUniversityDatabaseSegueIdentifier", sender: "0院校数据库")
            case -1:
                self.performSegueWithIdentifier("ToolsApplyManagerSegueIdentifier", sender: nil)
                UserAccessor.instance.setBool("isToolUsed" + "ApplyManager", value: true)
            case 0:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: "0网申流程")
            case 1:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: "0申请文书")
            case 2:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: "0留学费用")
                UserAccessor.instance.setBool("isToolUsed" + "AbroadExpense", value: true)
            case 3:
                ""
            case 4:
                self.performSegueWithIdentifier("ToolsGPACalculatorSegueIdentifier", sender: nil)
            case 5:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: "0出国考试")
            case 6:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: "0大学排名")
                UserAccessor.instance.setBool("isToolUsed" + "UniversityRankings", value: true)
            case 7:
                self.performSegueWithIdentifier("ToolsArticleSegueIdentifier", sender: "留学常用词汇")
            default:
                ""
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.performSegueWithIdentifier("ToolsTipsCalculatorSegueIdentifier", sender: nil)
            case 1:
                self.performSegueWithIdentifier("ToolsSizeConverterSegueIdentifier", sender: nil)
            case 2:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: "1.0信用卡")
            case 3:
                self.performSegueWithIdentifier("ToolsUnitConverterSegueIdentifier", sender: nil)
            case 4:
                ""
            default:
                ""
            }
        default:
            ""
        }
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
