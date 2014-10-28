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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(item: HLProgramInstancePreview) {
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
