//
//  UniversityDatabaseViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UniversityDatabaseViewController: GAITrackedViewController {
    
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
        self.screenName = "University Database Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        self.navigationView!.backgroundColor! = UIColor.HLBlue(0)
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
        if (!item.isKindOfClass(HLItemPreview)) {
            println("Wrong list item: \(item)")
            return UITableViewCell()
        }
        
        var cellReuseIdentifier = "UniversityDatabaseTableViewCellReuseIdentifier"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as ListTableView54Cell
        cell.configure(item as HLItemPreview)
        
        return cell
    }

    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "按排名查找"
        case 1:
            title = "按国家查找"
        case 2:
            title = "按专业查找"
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
