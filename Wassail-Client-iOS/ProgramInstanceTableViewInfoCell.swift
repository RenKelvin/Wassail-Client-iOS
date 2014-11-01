//
//  ProgramInstanceTableViewInfoCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/1/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ProgramInstanceTableViewInfoCell: UITableViewCell {
    
    @IBOutlet var timeLabel: UILabel?
    @IBOutlet var deadlineLabel: UILabel?
    @IBOutlet var schoolLabel: UILabel?
    @IBOutlet var departmentLabel: UILabel?
    @IBOutlet var degreeLabel: UILabel?
    @IBOutlet var webpageButton: UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(data: JSON) {
        timeLabel!.text = data["time"].stringValue
        deadlineLabel!.text = data["deadline"].stringValue
        schoolLabel!.text = data["school"].stringValue
        departmentLabel!.text = data["department"].stringValue
        degreeLabel!.text = data["degree"].stringValue
        webpageButton!.setTitle(data["webpage"].stringValue, forState: .Normal)
    }
    
}
