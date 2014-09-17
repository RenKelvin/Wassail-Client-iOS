//
//  UnitConverterViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UnitConverterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let info: UnitConverterInfo = UnitConverterInfo.instance
    
    var ci: Int = 0

    @IBOutlet var selectorView: RKSelectorView?
    
    @IBOutlet var leftPickerView: RKPickerView?
    @IBOutlet var rightPickerView: RKPickerView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        info.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    func selectCategory(number: Int) {

        ci = number
        
        let units = info.getUnits(number)
        if (units == nil) {
            return
        }
        
        leftPickerView!.reload(units!)
        rightPickerView!.reload(units!)
    }
    
    // MARK: - TableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitConverterTableViewCellReuseIdentifier", forIndexPath: indexPath) as UnitConverterTableViewCell
        
        cell.configure()
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "-"
        case 1:
            title = "-"
        default:
            title = ""
        }
        headerView.titleLabel?.text = title
        
        return headerView
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return info.numberOfCategories()
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RKSelectorCollectionViewCellReuseIdentifier", forIndexPath: indexPath) as RKSelectorCollectionViewCell
        
        // Highlight first category
        if (indexPath.row == 0) {
            cell.setSelected()
            
            selectCategory(indexPath.row)
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
        //
        var cell = collectionView.cellForItemAtIndexPath(indexPath) as RKSelectorCollectionViewCell
        cell.setSelected()
        
        //
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
