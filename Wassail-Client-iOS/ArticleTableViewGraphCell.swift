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
    
    override func configure(item: NSDictionary?) {
        
        if (item == nil) {
            return
        }
        
        let text = item!.objectForKey("content") as NSString?
        if (text == nil) {
            graphLabel!.text = nil
        }
        else {
            graphLabel!.text = text!
        }
        // FIXME: Manually modified preferredMaxLayoutWidth for different devices
        graphLabel!.preferredMaxLayoutWidth = DefaultInfo.instance.getScreenWidth() - 30.0
    }
    
}
