//
//  ArticleTableViewSectionCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleTableViewSectionCell: ArticleTableViewCell {
    
    @IBOutlet var sectionLabel: UILabel?
    
    override func configure(item: NSDictionary) {
        sectionLabel?.text = item.objectForKey("content") as NSString?
    }
    
}
