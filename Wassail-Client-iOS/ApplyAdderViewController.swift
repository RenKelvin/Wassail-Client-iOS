//
//  ApplyAdderViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyAdderViewController: GAITrackedViewController {
    
    let info: ApplyAdderInfo = ApplyAdderInfo.instance
    
    @IBOutlet var tableView: UITableView?
    
    @IBOutlet var navigationView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //
        info.reloadData()
        
        // GAITrackedViewController name
        self.screenName = "Apply Adder Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        navigationView!.backgroundColor! = UIColor.HLBlue(0)
        
    }
    
    // MARK: - IBAction
    
    @IBAction func doneButtonClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        var array: NSArray?

        if (tableView == self.searchDisplayController!.searchResultsTableView) {
             array = info.getFilteredPrograms(0, field: 0, text: self.searchDisplayController!.searchBar.text)
        }
        else {
             array = info.getAllPrograms()
        }

        if (array == nil) {
        return 0
}

        return array!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView!.dequeueReusableCellWithIdentifier("ApplyAdderTableViewCellReuseIdentifier", forIndexPath: indexPath) as ApplyAdderTableViewCell
        
        if (tableView == self.searchDisplayController!.searchResultsTableView) {
            let array = info.getFilteredPrograms(0, field: 0, text: self.searchDisplayController!.searchBar.text)
            let program = array!.objectAtIndex(indexPath.row) as HLProgramInstancePreview
            
            cell.configure(program)
        }
            
        else {
            let array = info.getAllPrograms()
            let program = array!.objectAtIndex(indexPath.row) as HLProgramInstancePreview
            
            cell.configure(program)
        }
        
        return cell
        
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "正在申请"
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
    
}
