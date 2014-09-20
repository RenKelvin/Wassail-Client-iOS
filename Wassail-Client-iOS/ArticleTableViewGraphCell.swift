//
//  ArticleTableViewGraphCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleTableViewGraphCell: ArticleTableViewCell {
    
    @IBOutlet var graphLabel: UILabel?

    override func configure(item: NSDictionary) {
        graphLabel?.text = item.objectForKey("content") as NSString?
    }
    
}
