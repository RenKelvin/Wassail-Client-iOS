//
//  ApplyViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyViewController: GAITrackedViewController {

    var apply: HLApply?
    
    @IBOutlet var navigationView: UIView?

    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?

    @IBOutlet var status1CountLabel: UILabel?
    @IBOutlet var status2CountLabel: UILabel?
    @IBOutlet var status3CountLabel: UILabel?
    @IBOutlet var status4CountLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
self.updateView()
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
    
    func updateView() {
        let programInstanceId = apply!.programInstanceId as NSNumber
        let preview = ApplyAccessor.instance.getProgramInstancePreviewByProgramInstanceId(programInstanceId) as HLProgramInstancePreview?
        
        titleLabel!.text = preview!.universityName
        noteLabel!.text = preview!.programName
        // dateLabel!.text = preview!.deadlineDate.description
        
        iconImageView!.sd_setImageWithURL(NSURL(string: preview!.iconAddress), placeholderImage: UIImage(named: "ImagePlaceHolder"))
    }

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ApplyTableViewCellReuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        // Configure the cell
        
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
    
}
