//
//  ApplyManagerTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyManagerTableViewCell: UITableViewCell {
 
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    
    @IBOutlet var statusButton: RKApplyButton?
    
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
            
        }
    }
    
    // MARK: -
    
    func configure(item: HLApply) {

let programInstanceId = item.programInstanceId as NSNumber

let preview = ApplyAccessor.instance.getProgramInstancePreviewByProgramInstanceId(programInstanceId) as HLProgramInstancePreview?
        
titleLabel!.text = preview!.universityName
noteLabel!.text = preview!.programName
        dateLabel!.text = preview!.deadlineDate.description

        //        if (item.icon != nil) {
        //            let name = item.icon!.address
        //            if (name != nil) {
        //                iconImageView?.image = DefaultInfo.instance.getImage(name!)
        //            }
        //        }
 
        //
statusButton!.setStatus(item.status.integerValue+1)
    }

}
