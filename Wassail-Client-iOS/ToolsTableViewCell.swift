//
//  ToolsTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ToolsTableViewCell: UITableViewCell {
    
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
    
    func configure(dict: NSDictionary) {
        iconImageView!.image = UIImage(named: dict.objectForKey("Icon") as String)
        titleLabel!.text = dict.objectForKey("Title") as String?
        noteLabel!.text = dict.objectForKey("Note") as String?
    }

}
