//
//  ListTableView44Cell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ListTableView44Cell: ListTableViewCell {
    
    override func configure(item: HLItemPreview) {
        titleLabel?.text = item.title as String?
    }

}
