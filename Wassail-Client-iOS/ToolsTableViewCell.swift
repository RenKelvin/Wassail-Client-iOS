//
//  ToolsTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ToolsTableViewCell: HLTableViewCell {
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var readyLabel: UILabel?
    @IBOutlet var badgeImageView: UIImageView?
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func configure(dict: NSDictionary?) {
        if (dict == nil) {
            return
        }
        
        iconImageView!.image = UIImage(named: dict!.objectForKey("icon") as String)
        titleLabel!.text = dict!.objectForKey("title") as String?
        noteLabel!.text = dict!.objectForKey("note") as String?
        
        let ready = dict!.objectForKey("ready") as NSString?
        if (ready == "false") {
            readyLabel!.hidden = false
            titleLabel!.textColor = UIColor.HLTextGray()
        }
        else {
            readyLabel!.hidden = true
            titleLabel!.textColor = UIColor.HLTextBlack()
        }
        
        badgeImageView!.image = UIImage(named: "BadgeRed")
    }
    
}
