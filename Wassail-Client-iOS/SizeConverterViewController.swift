//
//  SizeConverterViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/14/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class SizeConverterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let info: SizeConverterInfo = SizeConverterInfo.instance
    
    var ci: Int = 0
    
    @IBOutlet var selectorView: RKSelectorView?
    
    @IBOutlet var numbersView: RKNumbersView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        info.reloadData()
        
        // Highlight first category
        self.selectCategory(0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    // MARK: -
    
    func selectCategory(number: Int) {
        
        ci = number
        
        let header = info.getHeader(number)
        if (header == nil) {
            return
        }
        
        selectorView!.reloadData()
        
        numbersView!.reload(header!)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        let category = info.getCategory(ci) as NSDictionary?
        if (category == nil) {
            return 0
        }
        
        let groups = category!.objectForKey("groups") as NSArray
        
        return groups.count + 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //
        if (section == 0) {
            return 1
        }
        
        //
        let category = info.getCategory(ci) as NSDictionary?
        if (category == nil) {
            return 0
        }
        
        let groups = category!.objectForKey("groups") as NSArray
        let group = groups[section-1] as NSDictionary
        
        let rows = group.objectForKey("rows") as NSArray
        
        return rows.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SizeConverterTableViewCellReuseIdentifier", forIndexPath: indexPath) as RKNumbersViewCell
        
        //
        if (indexPath.section == 0) {
            let mySize = info.getMySize(ci) as NSDictionary?
            
            // No size yet
            if (mySize == nil) {
                cell.clear()
                return cell
            }
            
            let g = mySize!.objectForKey("group") as Int
            let r = mySize!.objectForKey("row") as Int
            
            let row = info.getRow(ci, group: g, row: r) as NSArray?
            
            cell.configure(row)
            
            return cell
        }
        
        let row = info.getRow(ci, group: indexPath.section-1, row: indexPath.row)
        
        cell.configure(row)
        
        return cell
    }
    
    // MARK: - UITableViewDataDelegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        //
        if (section == 0) {
            headerView.titleLabel?.text = "我的尺码"
            
            return headerView
        }
        
        //
        let category = info.getCategory(ci) as NSDictionary?
        if (category == nil) {
            return headerView
        }
        
        let groups = category!.objectForKey("groups") as NSArray
        let group = groups[section-1] as NSDictionary
        
        headerView.titleLabel?.text = group.objectForKey("title") as NSString
        
        return headerView
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Deselect
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let number = info.numberOfCategories()
        return number
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RKSelectorCollectionViewCellReuseIdentifier", forIndexPath: indexPath) as RKSelectorCollectionViewCell
        
        if (indexPath.row == ci) {
            cell.setSelected()
        }
        else {
            cell.setDeselected()
        }
        
        // Configure the cell
        let names = info.getNames()
        if (names == nil) { return cell }
        let name = names!.objectAtIndex(indexPath.row) as NSString
        let dict = info.getCategory(name) as NSDictionary?
        cell.configure(dict)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.selectCategory(indexPath.row)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = selectorView!.bounds.size.height
        let number = CGFloat(info.numberOfCategories())
        var width = selectorView!.bounds.size.width / number
        
        return CGSize(width: width, height: height)
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
