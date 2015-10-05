//
//  ApplyTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/1/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyTableViewCell: UITableViewCell {
    
    var apply: HLApply?
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var checkButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func checkButtonClicked(sender: UIButton?) {
        
        if (sender!.selected) {
            sender!.selected = false
            apply!.setDone(self.tag, done: false)
        }
        else {
            sender!.selected = true
            apply!.setDone(self.tag, done: true)
        }
    }
    
}
