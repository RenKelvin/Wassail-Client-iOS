//
//  ToolsViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tools: NSDictionary = ToolsInfo.instance.getTools()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        //        self.navigationController?.navigationBar.barTintColor = UIColor.HLBlue(0)
        //        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            return 5
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToolsTableViewCellReuseIdentifier", forIndexPath: indexPath) as ToolsTableViewCell
        
        // Configure the cell...
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let dict = tools.objectForKey("World Clock") as NSDictionary
                cell.configure(dict)
            case 1:
                let dict = tools.objectForKey("Tips Calculator") as NSDictionary
                cell.configure(dict)
            case 2:
                let dict = tools.objectForKey("Unit Converter") as NSDictionary
                cell.configure(dict)
            case 3:
                let dict = tools.objectForKey("Size Converter") as NSDictionary
                cell.configure(dict)
            case 4:
                let dict = tools.objectForKey("Info Container") as NSDictionary
                cell.configure(dict)
            default:
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                let dict = tools.objectForKey("University Rankings") as NSDictionary
                cell.configure(dict)
            case 1:
                let dict = tools.objectForKey("Credit Card") as NSDictionary
                cell.configure(dict)
            default:
                return cell
            }
        default:
            return cell
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "常用工具"
        case 1:
            title = "实用攻略"
        default:
            title = ""
        }
        headerView.titleLabel?.text = title
        
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                ""
            case 1:
                ""
            case 2:
                self.performSegueWithIdentifier("ToolsUnitConverterSegueIdentifier", sender: nil)
            case 3:
                self.performSegueWithIdentifier("ToolsSizeConverterSegueIdentifier", sender: nil)
            case 4:
                ""
            default:
                ""
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: ListInfo.instance.getList("大学排名"))
            case 1:
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
        var controller = segue.destinationViewController as UIViewController
        controller.setInfo(sender)
    }
    
}
