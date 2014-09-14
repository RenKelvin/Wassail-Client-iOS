//
//  ArticleViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var _tableView: UITableView?
    
    var article: HLArticle = HLArticle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set article title
        self.title = article.title
        
        // Apply table view cell self sizing
        self._tableView!.estimatedRowHeight = 88.0
        self._tableView!.rowHeight = UITableViewAutomaticDimension
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
        
        let item = article.item(indexPath.section, row: indexPath.row) as NSDictionary
        
        var cellReuseIdentifier = "ArticleTableViewItemCellReuseIdentifier"
        
        let type = item.objectForKey("kind") as NSString
        switch type {
        case "Section":
            cellReuseIdentifier = "ArticleTableViewSectionCellReuseIdentifier"
        case "Graph":
            cellReuseIdentifier = "ArticleTableViewGraphCellReuseIdentifier"
        default:
            cellReuseIdentifier = "ArticleTableViewItemCellReuseIdentifier"
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath) as ArticleTableViewCell
        cell.configure(item)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        let title: String = article.titleForChapter(section)
        
        headerView.setTitle(title)
        
        return headerView
    }
    
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 44.0
//    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
