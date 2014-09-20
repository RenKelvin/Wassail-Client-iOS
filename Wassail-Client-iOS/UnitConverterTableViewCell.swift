//
//  UnitConverterTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class UnitConverterTableViewCell: UITableViewCell {
    
    @IBOutlet var leftLabel: UILabel?
    @IBOutlet var rightLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(dict: NSDictionary) {
        leftLabel!.text = dict.objectForKey("title") as NSString
        rightLabel!.text = dict.objectForKey("description") as NSString
    }
    
}
