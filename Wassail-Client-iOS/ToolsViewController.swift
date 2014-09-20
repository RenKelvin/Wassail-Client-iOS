//
//  ToolsViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ToolsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var tableViewHeaderView: UIView?
    
    var tools: NSDictionary = ToolsInfo.instance.getTools()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        let dict = UserAccessor.instance.getMySize()
        println(dict)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Blue)
        
        //
        self.tableView?.addSubview(self.tableViewHeaderView!)
        
        let width = self.tableView?.superview?.frame.size.width
        self.tableViewHeaderView?.frame.size.width = width!
        self.tableViewHeaderView?.frame.origin.y = -44.0
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
            return 2
        case 1:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToolsTableViewCellReuseIdentifier", forIndexPath: indexPath) as ToolsTableViewCell
        
        // Configure the cell
        
        var dict: NSDictionary?
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                dict = tools.objectForKey("University Rankings") as? NSDictionary
            case 1:
                dict = tools.objectForKey("Credit Card") as? NSDictionary
            default:
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                dict = tools.objectForKey("World Clock") as? NSDictionary
            case 1:
                dict = tools.objectForKey("Tips Calculator") as? NSDictionary
            case 2:
                dict = tools.objectForKey("Unit Converter") as? NSDictionary
            case 3:
                dict = tools.objectForKey("Size Converter") as? NSDictionary
            case 4:
                dict = tools.objectForKey("Info Container") as? NSDictionary
            default:
                return cell
            }
        default:
            return cell
        }
        
        cell.configure(dict!)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "出国前工具"
        case 1:
            title = "出国后工具"
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
            switch indexPath.row {
            case 0:
                self.performSegueWithIdentifier("ToolsListSegueIdentifier", sender: ListInfo.instance.getList("大学排名"))
            case 1:
                ""
            default:
                ""
            }
        case 1:
            switch indexPath.row {
            case 0:
                ""
            case 1:
                self.performSegueWithIdentifier("ToolsTipsCalculatorSegueIdentifier", sender: nil)
            case 2:
                self.performSegueWithIdentifier("ToolsUnitConverterSegueIdentifier", sender: nil)
            case 3:
                self.performSegueWithIdentifier("ToolsSizeConverterSegueIdentifier", sender: nil)
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
        var controller = segue.destinationViewController as UIViewController
        controller.setInfo(sender)
    }
    
}
