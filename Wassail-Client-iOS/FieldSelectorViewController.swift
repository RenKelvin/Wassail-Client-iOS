//
//  FieldSelectorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/3/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class FieldSelectorViewController: GAITrackedViewController {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var navigationView: UIView?
    
    var listName: NSString?
    var list: HLList?
    
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
        self.screenName = "Field Selector Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        navigationView!.backgroundColor! = UIColor.HLBlue(0)
    }
    
    // MARK: -
    
    override func setInfo(info: AnyObject?) {
        if (info != nil) {
            listName = info as? NSString
        }
    }
    
    func reloadData() {
        
        if (listName == nil) {
            return
        }
        
        list = ListInfo.instance.getList(listName!)
        
    }
    
    // MARK: - IBAction
    
    @IBAction func doneButtonClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        if (list == nil) {
            return 0
        }
        
        return list!.numberOfGroups()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if (list == nil) {
            return 0
        }
        
        return list!.numberOfItemsInGroup(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (list == nil) {
            return UITableViewCell()
        }
        
        let item = list!.item(indexPath.section, row: indexPath.row)
        if (item == nil) {
            return UITableViewCell()
        }
        if (!item!.isKindOfClass(HLItemPreview)) {
            println("Wrong list item: \(item!)")
            return UITableViewCell()
        }
        
        var cellReuseIdentifier = "FieldSelectorTableViewCellReuseIdentifier"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as ListTableViewSimple54Cell
        cell.configure(item as HLItemPreview)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        if (list == nil) {
            return headerView
        }
        
        var title: String = list!.titleForGroup(section)
        
        headerView.setTitle(title)
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (list == nil) {
            return 0.0
        }
        
        var title: String = list!.titleForGroup(section)
        
        if (title == "-" || title == "~") {
            return 0.0
        }
        
        return 20.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Get source item
        if (list == nil) {
            return
        }
        
        let itemPreview = list!.item(indexPath.section, row: indexPath.row) as HLItemPreview
        
        // Set default field
        self.dismissViewControllerAnimated(true, completion: nil)
        NSUserDefaults.standardUserDefaults().setInteger(itemPreview.address!.integerValue as Int, forKey: "defaultField")
        NSUserDefaults.standardUserDefaults().setObject(itemPreview.title as NSString?, forKey: "defaultFieldName")
        NSUserDefaults.standardUserDefaults().synchronize()
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
