//
//  ProgramInstanceTableViewContactCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/1/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ProgramInstanceTableViewContactCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var emailLabel: UILabel?
    @IBOutlet var phoneLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(data: JSON) {
        nameLabel!.text = data["name"].stringValue
        emailLabel!.text = data["email"].stringValue
        phoneLabel!.text = data["phone"].stringValue
    }

}
