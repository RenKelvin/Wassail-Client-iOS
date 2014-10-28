//
//  ApplyAdderTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyAdderTableViewCell: UITableViewCell {
    
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
        if (statusButton!.status == 0) {
            let apply = ApplyAccessor.instance.createApply(self.item!) as HLApply?
            
            // TODO: add apply
        }
    }
    
    // MARK: -
    
    func configure(item: HLProgramInstancePreview) {
        
        self.item = item
        
        titleLabel?.text = item.universityName
        noteLabel?.text = item.programName
        
        //        if (item.icon != nil) {
        //            let name = item.icon!.address
        //            if (name != nil) {
        //                iconImageView?.image = DefaultInfo.instance.getImage(name!)
        //            }
        //        }
    }
    
}
