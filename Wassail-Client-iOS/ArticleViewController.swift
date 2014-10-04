//
//  ArticleViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var tableView: UITableView?
    
    @IBOutlet var headerView: UIView?
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var authorLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var headerLabel: UILabel?
    
    @IBOutlet var sectionCell: ArticleTableViewCell?
    @IBOutlet var graphCell: ArticleTableViewCell?
    @IBOutlet var itemCell: ArticleTableViewCell?
    
    var articleName: NSString?
    var article: HLArticle?
    
    var offscreenCells: NSMutableDictionary = NSMutableDictionary()
    var cellHeights: NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LoadData
        self.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.TransparentWithDarkText)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: -
    
    override func setInfo(info: AnyObject?) {
        if (info != nil) {
            articleName = info as? NSString
        }
    }
    
    func reloadData() {
        
        if (articleName == nil) {
            return
        }
        
        article = ArticleInfo.instance.getArticle(articleName!)
        
        if (article == nil) {
            return
        }
        
        if (article!.title == "留学时间表" || article!.title == "常用词汇") {
            self.navigationItem.title = article!.title
            self.tableView!.tableHeaderView = nil
        }
        else {
            self.updateHeader()
        }
        
        // Force reload
        self.tableView!.reloadData()
        
    }
    
    func updateHeader() {
        
        if (article == nil) {
            return
        }
        
        self.titleLabel!.text = article!.title
        if (article!.author != nil) {
            self.authorLabel!.text = article!.author!+"  "
        }
        else {
            self.authorLabel!.text = article!.author
        }
        self.dateLabel!.text = article!.date
        //        self.headerLabel!.text = article!.header
        
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        if (article == nil) {
            return 0
        }
        
        return article!.numberOfChapters()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if (article == nil) {
            return 0
        }
        
        return article!.numberOfGraphsInChapter(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (article == nil) {
            return UITableViewCell()
        }
        
        var item = article!.item(indexPath.section, row: indexPath.row) as NSDictionary?
        
        var cellReuseIdentifier = "ArticleTableViewItemCellReuseIdentifier"
        
        let type = item!.objectForKey("kind") as NSString
        switch type {
        case "Section":
            cellReuseIdentifier = "ArticleTableViewSectionCellReuseIdentifier"
        case "Graph":
            cellReuseIdentifier = "ArticleTableViewGraphCellReuseIdentifier"
        case "Item":
            cellReuseIdentifier = "ArticleTableViewItemCellReuseIdentifier"
            item = item!.objectForKey("content") as? NSDictionary
        default:
            cellReuseIdentifier = "ArticleTableViewItemCellReuseIdentifier"
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as ArticleTableViewCell
        cell.controller = self
        cell.configure(item)
        
        // Make sure the constraints have been added to this cell, since it may have just been created from scratch
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        return cell
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        
        if (article != nil && article!.title == "常用词汇") {
            return ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"]
        }
        else {
            return []
        }
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let h = self.cellHeights.objectForKey(indexPath) as CGFloat?
        if (h != nil) {
            return h!
        }
        
        if (article == nil) {
            return 0.0
        }
        
        // Get cell identifier
        var cellReuseIdentifier: NSString = ""
        var cell: ArticleTableViewCell?
        
        var item = article!.item(indexPath.section, row: indexPath.row) as NSDictionary?
        let type = item!.objectForKey("kind") as NSString
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("ArticleViewController") as ArticleViewController
        
        switch type {
        case "Section":
            cellReuseIdentifier = "ArticleTableViewSectionCellReuseIdentifier"
            cell = self.offscreenCells.objectForKey(cellReuseIdentifier) as ArticleTableViewCell?
            if (cell == nil) {
                cell = controller.sectionCell!
                self.offscreenCells.setObject(cell!, forKey: cellReuseIdentifier)
            }
        case "Graph":
            cellReuseIdentifier = "ArticleTableViewGraphCellReuseIdentifier"
            cell = self.offscreenCells.objectForKey(cellReuseIdentifier) as ArticleTableViewCell?
            if (cell == nil) {
                cell = controller.graphCell!
                self.offscreenCells.setObject(cell!, forKey: cellReuseIdentifier)
            }
        case "Item":
            cellReuseIdentifier = "ArticleTableViewItemCellReuseIdentifier"
            cell = self.offscreenCells.objectForKey(cellReuseIdentifier) as ArticleTableViewCell?
            item = item!.objectForKey("content") as? NSDictionary
            if (cell == nil) {
                cell = controller.itemCell!
                self.offscreenCells.setObject(cell!, forKey: cellReuseIdentifier)
            }
        default:
            // Unknown cell
            return 0.0
        }
        
        // Set width
        cell!.frame.size.width = DefaultInfo.instance.getScreenWidth()
        
        // Configure the cell for this indexPath
        cell!.controller = self
        cell!.configure(item)
        
        // Make sure the constraints have been added to this cell, since it may have just been created from scratch
        cell!.setNeedsUpdateConstraints()
        cell!.updateConstraintsIfNeeded()
        
        // Set width
        cell!.bounds = CGRectMake(0.0, 0.0, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell!.bounds))
        
        // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
        // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
        // in the UITableViewCell subclass
        cell!.setNeedsLayout()
        cell!.layoutIfNeeded()
        
        let height = cell!.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height as CGFloat
        self.cellHeights.setObject(height, forKey: indexPath)
        
        return height
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let h = self.cellHeights.objectForKey(indexPath) as CGFloat?
        if (h != nil) {
            return h!
        }
        
        return 44.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        
        var headerView = NSBundle.mainBundle().loadNibNamed("RKArticleHeaderView", owner: nil, options: nil).first as RKArticleHeaderView
        
        if (article == nil) {
            return headerView
        }
        
        var title: String = article!.titleForChapter(section)
        
        headerView.setTitle(title)
        
        if (self.article!.title == "留学时间表") {
            headerView.setLeaderColor(section)
        }
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (article == nil) {
            return 0.0
        }
        
        var title: String = article!.titleForChapter(section)
        
        if (title == "-") {
            return 0.0
        }
        
        return 40.0
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
