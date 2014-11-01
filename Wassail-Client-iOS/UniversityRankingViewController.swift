//
//  UniversityRankingViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UniversityRankingViewController: GAITrackedViewController, UIAlertViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var errorLabel: UILabel?
    
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
        self.screenName = "University Ranking Screen"
        
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
        
        //
        UniversityAccessor.instance.getUniversityRanking(listName!, getUniversityRankingHandler)
    }
    
    func updateView() {
        //
        self.tableView!.reloadData()
    }
    
    func getUniversityRankingHandler(success: Bool, list: HLList?) {
        if (success) {
            self.list = list
            
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
        
        var cellReuseIdentifier = "UniversityRankingTableViewCellReuseIdentifier"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as UniversityRankingTableViewCell
        cell.configure(item as HLUniversityPreviewWithRank)
        
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
        
        if (itemPreview.sourceType == nil) {
            return
        }
        
        let segueIdentifier = "UniversityRanking" + itemPreview.sourceType! + "SegueIdentifier"
        self.performSegueWithIdentifier(segueIdentifier, sender: itemPreview.address)
        
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
