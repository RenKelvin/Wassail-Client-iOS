//
//  ListTableViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var subTitleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var iconImageView: UIImageView?

    func configure(item: HLItemPreview) {

    }

}
