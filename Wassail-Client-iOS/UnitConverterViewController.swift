//
//  UnitConverterViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UnitConverterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var lengthButton: UIButton?
    @IBOutlet var areaButton: UIButton?
    @IBOutlet var volumeButton: UIButton?
    @IBOutlet var weightButton: UIButton?
    @IBOutlet var tempButton: UIButton?
    @IBOutlet var speedButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    
    @IBAction func buttonSelected(sender: UIButton) {
        if sender.selected == true {
            return
        }
            
        else {
            lengthButton?.selected = false
            areaButton?.selected = false
            volumeButton?.selected = false
            weightButton?.selected = false
            tempButton?.selected = false
            speedButton?.selected = false
            
            sender.selected = true
        }
    }
    
    // MARK: - Table view data source
    
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
