//
//  UnitConverterViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UnitConverterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RKPickerViewDelegate {
    
    let info: UnitConverterInfo = UnitConverterInfo.instance
    
    var ci: Int = 0
    var iu: NSDictionary?
    var ou: NSDictionary?
    
    var input: Double = 1.0
    @IBOutlet var inputTextField: UITextField?
    @IBOutlet var inputUnitLabel: UILabel?
    
    var output: Double = 0.0
    @IBOutlet var outputTextField: UITextField?
    @IBOutlet var outputUnitLabel: UILabel?
    
    @IBOutlet var selectorView: RKSelectorView?
    
    @IBOutlet var leftPickerView: RKPickerView?
    @IBOutlet var rightPickerView: RKPickerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        info.reloadData()
        
        iu = info.getUnit(ci, ui: 0)
        ou = info.getUnit(ci, ui: 0)
        self.updateNumbersByInput()
        
        leftPickerView!.delegate = self
        leftPickerView!.tag = 0
        rightPickerView!.delegate = self
        rightPickerView!.tag = 1
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        //        println("viewWillAppear")
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        self.selectCategory(0)
        self.updateNumbersByInput()
    }
    
    override func viewWillLayoutSubviews() {
        //        println("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        //        println("viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(animated: Bool) {
        //        println("viewDidAppear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    func selectCategory(number: Int) {
        
        ci = number
        iu = info.getUnit(ci, ui: 0)
        ou = info.getUnit(ci, ui: 1)
        
        let units = info.getUnits(ci)
        if (units == nil) {
            return
        }
        
        selectorView!.reloadData()
        
        leftPickerView!.reload(units!)
        rightPickerView!.reload(units!)
    }
    
    func updateViews() {
        
        inputTextField!.text = String(format: "%.2g", input)
        outputTextField!.text = String(format: "%.2g", output)
        
        inputUnitLabel!.text = iu!.objectForKey("unit") as NSString
        outputUnitLabel!.text = ou!.objectForKey("unit") as NSString
    }
    
    func updateNumbersByInput() {
        
        output = convert(input)
        
        self.updateViews()
    }
    
    func convert(input: Double) -> Double {
        if (iu == nil) {
            return 0.0
        }
        if (ou == nil) {
            return 0.0
        }
        
        let k1: Double = (iu!.objectForKey("k") as NSString).doubleValue
        let b1: Double = (iu!.objectForKey("b") as NSString).doubleValue
        
        let k2: Double = (ou!.objectForKey("k") as NSString).doubleValue
        let b2: Double = (ou!.objectForKey("b") as NSString).doubleValue
        
        let output = (k1*input+b1-b2)/k2
        return output
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
            let knows = info.getKnows(ci)
            return knows!.count
            
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UnitConverterTableViewCellReuseIdentifier", forIndexPath: indexPath) as UnitConverterTableViewCell
        
        switch indexPath.section {
        case 0:
            "" // TODO: get user favs
            
        case 1:
            let knows = info.getKnows(ci)
            cell.configure(knows![indexPath.row] as NSDictionary)
            
        default:
            return cell
        }
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "我的换算"
        case 1:
            title = "常用换算"
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
        self.updateNumbersByInput()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let height = selectorView!.bounds.size.height
        let number = CGFloat(info.numberOfCategories())
        var width = selectorView!.bounds.size.width / number
        
        return CGSize(width: width, height: height)
    }
    
    // MARK: - RKPickerViewDelegate
    
    func pickerView(#pickerView: RKPickerView, didselectedAtIndex i: Int) {
        
        switch pickerView.tag {
        case 0:
            iu = info.getUnit(ci, ui: i)
        case 1:
            ou = info.getUnit(ci, ui: i)
        default:
            return
        }
        
        self.updateNumbersByInput()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        input = NSString(string: textField.text).doubleValue
        
        self.updateNumbersByInput()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
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
