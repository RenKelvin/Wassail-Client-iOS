//
//  RKSelectorCollectionViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/15/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKSelectorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var backgroundImageView: UIImageView?
    
    func configure(dict: NSDictionary?) {
        if (dict == nil) {
            return
        }
        
        titleLabel!.text = dict!.objectForKey("title") as NSString
        iconImageView!.image = UIImage(named: dict!.objectForKey("icon") as NSString)
    }
    
    func setSelect() {
        backgroundImageView!.highlighted = true
    }
    
    func setDeselect() {
        backgroundImageView!.highlighted = false
    }
    
}
