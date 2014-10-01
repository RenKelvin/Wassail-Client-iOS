//
//  ArticleViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView?
    
    @IBOutlet var headerView: UIView?
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var authorLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var headerLabel: UILabel?
    
    @IBOutlet var sectionCell: ArticleTableViewCell?
    @IBOutlet var graphCell: ArticleTableViewCell?
    @IBOutlet var itemCell: ArticleTableViewCell?
    
    var article: HLArticle = HLArticle()
    
    var offscreenCells: NSMutableDictionary = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply table view cell self sizing
        // DISABLED FOR ISO 7
        //        self.tableView!.estimatedRowHeight = 88.0
        //        self.tableView!.rowHeight = UITableViewAutomaticDimension
        
        // Force reload
        self.tableView!.reloadData()
        
        // Article header
        self.titleLabel!.text = article.title
        self.authorLabel!.text = article.author
        self.dateLabel!.text = article.date
        //        self.headerLabel!.text = nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Default)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // TODO: adjust header height
        self.headerView!.sizeToFit()
        
    }
    
    // MARK: -
    
    override func setInfo(info: AnyObject?) {
        if (info != nil) {
            article = info as HLArticle
        }
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return article.numberOfChapters()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return article.numberOfGraphsInChapter(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var item = article.item(indexPath.section, row: indexPath.row) as NSDictionary?
        
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
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // Get cell identifier
        var cellReuseIdentifier: NSString = ""
        var cell: ArticleTableViewCell?
        
        var item = article.item(indexPath.section, row: indexPath.row) as NSDictionary?
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
        
        return height
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension;
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        
        var headerView = NSBundle.mainBundle().loadNibNamed("RKArticleHeaderView", owner: nil, options: nil).first as RKArticleHeaderView
        
        var title: String = article.titleForChapter(section)
        
        headerView.setTitle(title)
        
        if (self.article.title == "留学时间表") {
            headerView.setLeaderColor(section)
        }
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        var title: String = article.titleForChapter(section)
        
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
