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
    
    @IBOutlet var selectorView: RKSelectorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        info.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("SizeConverterTableViewCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        // cell.configure()
        
        return cell
    }
    
    // MARK: - TableViewDataDelegate
    
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
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = info.numberOfCategories()
        
        return number
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RKSelectorCollectionViewCellReuseIdentifier", forIndexPath: indexPath) as RKSelectorCollectionViewCell
        
        // Configure the cell
        var dict: NSDictionary?
        switch indexPath.row {
        case 0:
            dict = info.getCategory("cloth")
        case 1:
            dict = info.getCategory("pants")
        case 2:
            dict = info.getCategory("shoes")
        case 3:
            dict = info.getCategory("hat")
        case 4:
            dict = info.getCategory("ring")
        case 5:
            dict = info.getCategory("bra")
        default:
            dict = nil
        }
        cell.configure(dict)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //
        var cell = collectionView.cellForItemAtIndexPath(indexPath) as RKSelectorCollectionViewCell
        cell.setSelected()
        
        // TODO: selected
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
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
