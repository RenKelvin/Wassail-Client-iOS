//
//  RKTableHeaderView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKTableHeaderView: UIView {
    
    @IBOutlet var titleLabel: UILabel?
    
    func setTitle(title: String) {
        titleLabel?.text = title
    }
}
