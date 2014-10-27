//
//  ListTableView54Cell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ListTableView54Cell: ListTableViewCell {
    
    override func configure(item: HLItemPreview) {
        titleLabel?.text = item.title
        noteLabel?.text = item.note
        
        if (item.icon != nil) {
            let name = item.icon!.address
            if (name != nil) {
                iconImageView?.image = DefaultInfo.instance.getImage(name!)
            }
        }
    }
    
}
