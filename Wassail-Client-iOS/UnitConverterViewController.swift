//
//  UnitConverterViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UnitConverterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitConverterTableViewCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell...
//        let path = NSBundle.mainBundle().pathForResource("Wassail", ofType: "plist")
//        let plist = NSDictionary(contentsOfFile: path!)
//        let toolsDict = plist.valueForKey("Tools") as NSDictionary
//        
//        switch indexPath.row {
//        case 0:
//            let dict = toolsDict.valueForKey("World Clock") as NSDictionary
//            cell.configure(dict)
//        case 1:
//            let dict = toolsDict.valueForKey("Tips Calculator") as NSDictionary
//            cell.configure(dict)
//        case 2:
//            let dict = toolsDict.valueForKey("Unit Converter") as NSDictionary
//            cell.configure(dict)
//        case 3:
//            let dict = toolsDict.valueForKey("Size Converter") as NSDictionary
//            cell.configure(dict)
//        case 4:
//            let dict = toolsDict.valueForKey("Info Container") as NSDictionary
//            cell.configure(dict)
//        default:
//            return cell
//        }
        
        return cell
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
