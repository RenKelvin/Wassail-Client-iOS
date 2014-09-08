//
//  ToolsViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ToolsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Configure Navigation Bar and Status Bar
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToolsTableViewCellReuseIdentifier", forIndexPath: indexPath) as ToolsTableViewCell
        
        // Configure the cell...
        let path = NSBundle.mainBundle().pathForResource("Wassail", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: path!)
        let toolsDict = plist.valueForKey("Tools") as NSDictionary
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let dict = toolsDict.valueForKey("World Clock") as NSDictionary
                cell.configure(dict)
            case 1:
                let dict = toolsDict.valueForKey("Tips Calculator") as NSDictionary
                cell.configure(dict)
            case 2:
                let dict = toolsDict.valueForKey("Unit Converter") as NSDictionary
                cell.configure(dict)
            case 3:
                let dict = toolsDict.valueForKey("Size Converter") as NSDictionary
                cell.configure(dict)
            case 4:
                let dict = toolsDict.valueForKey("Info Container") as NSDictionary
                cell.configure(dict)
            default:
                return cell
            }
        case 1:
            switch indexPath.row {
            case 0:
                let dict = toolsDict.valueForKey("University Rankings") as NSDictionary
                cell.configure(dict)
            case 1:
                let dict = toolsDict.valueForKey("Credit Card") as NSDictionary
                cell.configure(dict)
            default:
                return cell
            }
        default:
            return cell
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "123"
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
