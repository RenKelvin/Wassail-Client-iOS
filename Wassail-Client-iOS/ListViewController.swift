//
//  ListViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var list: HLList = HLList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let item = list.item(indexPath.section, row: indexPath.row) as HLItemPreview
        let cellReuseIdentifier = "ListTableView44CellReuseIdentifier"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as ListTableViewCell
        
        cell.configure(item)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        let title: String = list.titleForGroup(section)
        
        headerView.setTitle(title)
        
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let item = list.item(indexPath.section, row: indexPath.row) as HLItemPreview
        let itemName = item.source.objectForKey("name") as NSString
        let source = DefaultInfo.instance.getItem(itemName) as HLItem?
        
        self.performSegueWithIdentifier("ListArticleSegueIdentifier", sender: source)
        
        //        let item = list.item(indexPath.section, row: indexPath.row) as HLItemPreview
        //        let itemName = ListInfo.instance.getList(item.source.objectForKey("name") as NSString)
        //        let source = ListInfo.instance.getList(item.source.objectForKey("name") as NSString) as HLList?
        //
        //        let segueIdentifier = "ListListSegueIdentifier"
        //        var destinationController = ListViewController()
        //        destinationController.setInfo(source)
        //
        //        let segue = UIStoryboardSegue(identifier: segueIdentifier, source: self, destination: ListViewController())
        
        // segue.perform()
        
        // self.navigationController?.pushViewController(destinationController, animated: true)
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
