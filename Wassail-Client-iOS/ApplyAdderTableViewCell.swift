//
//  ApplyAdderTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyAdderTableViewCell: UITableViewCell, UIAlertViewDelegate {
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    
    @IBOutlet var statusButton: RKApplyButton?
    
    var item: HLProgramInstancePreview?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - IBAction
    
    @IBAction func statusButtonClicked() {
        if (statusButton!.stat == 0) {
            let alert = UIAlertView(title: "开始申请", message: "确定开始申请该项目吗？", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
            alert.show()
        }
    }
    
    // MARK: -
    
    func configure(item: HLProgramInstancePreview) {
        self.item = item
        
        self.updateView()
    }
    
    func updateView() {
        titleLabel?.text = item!.universityName
        noteLabel?.text = item!.programName
        
        iconImageView!.sd_setImageWithURL(NSURL(string: item!.iconAddress), placeholderImage: UIImage(named: "ImagePlaceHolder"))
        
        let id = item!.programInstanceId as NSNumber
        let apply = ApplyAccessor.instance.getApplyByProgramInstanceId(id)
        
        if (apply == nil) {
            statusButton!.setStatus(0)
        }
        else {
            statusButton!.setStatus(apply!.status.integerValue)
        }
    }
    
    // MARK: - UIAlertViewDelegate
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if (buttonIndex != 1) {
            return
        }
        
        // Add apply
        let apply = ApplyAccessor.instance.createApply(self.item!) as HLApply?
        apply!.programInstanceId = self.item!.programInstanceId
        apply!.status = NSNumber(int: 1)
        
        self.updateView()
    }
}
