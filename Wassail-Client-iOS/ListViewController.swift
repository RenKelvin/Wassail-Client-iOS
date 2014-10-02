//
//  ListViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    
    var list: HLList = HLList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set article title
        self.title = list.title
        
        // Apply table view cell self sizing
        // DISABLED FOR ISO 7
        //        self.tableView!.estimatedRowHeight = 88.0
        //        self.tableView!.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Blue)
    }
    
    // MARK: -
    
    override func setInfo(info: AnyObject?) {
        if (info != nil) {
            list = info as HLList
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return list.numberOfGroups()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return list.numberOfItemsInGroup(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellReuseIdentifier = "ListTableViewSimpleCellReuseIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as ListTableViewCell
        
        let item = list.item(indexPath.section, row: indexPath.row)
        if (!item.isKindOfClass(HLItemPreview)) {
            println("Wrong list item: \(item)")
            return cell
        }

        cell.configure(item as HLItemPreview)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // TODO: manaully adjust cell height
        
        return 44.0
    }
    
    //    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //
    //        return 44.0
    //    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = list.titleForGroup(section)
        
        headerView.setTitle(title)
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        var title: String = list.titleForGroup(section)
        
        if (title == "-") {
            return 0.0
        }
        
        return 20.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // Get source item
        let item = list.item(indexPath.section, row: indexPath.row) as HLItemPreview
        
        let type = item.type
        switch type {
        case "HLListPreview":
            let itemAddress = item.address
            let source = ListInfo.instance.getList(itemAddress) as HLList?
            
            if (source == nil) {
                return
            }
            
            self.performSegueWithIdentifier("ListListSegueIdentifier", sender: source)
            
        case "HLArticlePreview":
            let itemAddress = item.address
            let source = ArticleInfo.instance.getArticle(itemAddress) as HLArticle?
            
            if (source == nil) {
                return
            }
            
            self.performSegueWithIdentifier("ListArticleSegueIdentifier", sender: source)
            
        case "HLLink":
            let itemAddress = item.address
            
            self.performSegueWithIdentifier("ListBrowserSegueIdentifier", sender: itemAddress)
            
        default:
            ""
        }
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
