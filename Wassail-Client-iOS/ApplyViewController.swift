//
//  ApplyViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyViewController: GAITrackedViewController, UIActionSheetDelegate {
    
    var apply: HLApply?
    var preview: HLProgramInstancePreview?
    var requirements: HLProgramInstanceRequirements?
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    
    @IBOutlet var statusBarItem: UIBarItem?
    
    @IBOutlet var status1CountLabel: UILabel?
    @IBOutlet var status2CountLabel: UILabel?
    @IBOutlet var status3CountLabel: UILabel?
    @IBOutlet var status4CountLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "Apply Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        navigationView!.backgroundColor! = UIColor.HLBlue(0)
    }
    
    // MARK: -
    
    override func setInfo(info: AnyObject?) {
        if (info != nil) {
            apply = info as? HLApply
        }
    }
    
    func reloadData() {
        
        let programInstanceId = apply!.programInstanceId as NSNumber
        preview = UniversityAccessor.instance.getProgramInstancePreviewByProgramInstanceId(programInstanceId) as HLProgramInstancePreview?
        requirements = UniversityAccessor.instance.getProgramInstanceRequirementsByProgramInstanceId(programInstanceId) as HLProgramInstanceRequirements?
        
        self.updateView()
        self.tableView!.reloadData()
    }
    
    func updateView() {
        // Header
        let programInstanceId = apply!.programInstanceId as NSNumber
        let preview = UniversityAccessor.instance.getProgramInstancePreviewByProgramInstanceId(programInstanceId) as HLProgramInstancePreview?
        
        titleLabel!.text = preview!.universityName
        noteLabel!.text = preview!.programName
        dateLabel!.text = preview!.deadlineDate.normalString()
        
        iconImageView!.sd_setImageWithURL(NSURL(string: preview!.iconAddress), placeholderImage: UIImage(named: "ImagePlaceHolder"))
        
        // Bar item
        switch (apply!.status.integerValue) {
        case 1:
            statusBarItem!.title = "正在申请"
        case 2:
            statusBarItem!.title = "申请完成"
        case 3:
            statusBarItem!.title = "已录取"
        case 4:
            statusBarItem!.title = "已拒绝"
        default:
            ""
        }
        
        // Apply stats
        ApplyAccessor.instance.getApplyStats(programInstanceId, getApplyStatsHandler)
    }
    
    func getApplyStatsHandler(success: Bool, data: NSDictionary?) {
        if (success) {
            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                let json = JSON(data!)
                self.status1CountLabel!.text = String(json["applying"].intValue)
                self.status2CountLabel!.text = String(json["applied"].intValue)
                self.status3CountLabel!.text = String(json["addmited"].intValue)
                self.status4CountLabel!.text = String(json["rejected"].intValue)
            })
        }
        else {
            // TODO: get apply stats error
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func programHeaderTapped() {
        self.performSegueWithIdentifier("ApplyProgramInstanceSegueIdentifier", sender: apply!.programInstanceId)
    }
    
    @IBAction func applyStatusTapped() {
        let actionSheet = UIActionSheet(title: "设置申请状态", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil)
        
        actionSheet.addButtonWithTitle("正在申请")
        actionSheet.addButtonWithTitle("申请完成")
        actionSheet.addButtonWithTitle("已录取")
        actionSheet.addButtonWithTitle("已拒绝")
        
        actionSheet.showInView(self.view)
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        let array = requirements!.getRequirements() as NSArray
        let subArray = array[section] as NSArray
        
        return subArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ApplyTableViewCellReuseIdentifier", forIndexPath: indexPath) as ApplyTableViewCell
        
        // Configure the cell
        let array = requirements!.getRequirements() as NSArray
        let subArray = array[indexPath.section] as NSArray
        let req = subArray[indexPath.row] as NSArray
        cell.tag = req[0] as Int
        cell.titleLabel!.text = req[1] as NSString
        cell.noteLabel!.text = req[2] as NSString
        
        let done = apply!.getDone(req[0] as Int) as Bool
        cell.checkButton!.selected = done
        cell.apply = self.apply
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var headerView = NSBundle.mainBundle().loadNibNamed("RKTableHeaderView", owner: nil, options: nil).first as RKTableHeaderView
        
        var title: String = ""
        switch section {
        case 0:
            title = "标准化考试"
        case 1:
            title = "申请材料"
        case 2:
            title = "申请费"
        default:
            title = ""
        }
        
        headerView.titleLabel?.text = title
        
        return headerView
    }
    
    // MARK: - UIActionSheetDelegate
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex {
        case 0:
            ""
        case 1:
            apply!.status = 1
        case 2:
            apply!.status = 2
        case 3:
            apply!.status = 3
        case 4:
            apply!.status = 4
        default:
            ""
        }
        
        self.updateView()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        var controller = segue.destinationViewController as UIViewController
        controller.setInfo(sender)
    }
    
}
