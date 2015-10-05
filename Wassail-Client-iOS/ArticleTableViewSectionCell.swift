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
    
    override func configure(item: NSDictionary?) {
        
        if (item == nil) {
            return
        }
        
        let text = item!.objectForKey("content") as! NSString?
        if (text == nil) {
            sectionLabel!.text = nil
        }
        else if (text! == "-") {
            sectionLabel!.text = ""
        }
        else {
            sectionLabel!.text = text! as String
        }
        // FIXME: Manually modified preferredMaxLayoutWidth for different devices
        sectionLabel!.preferredMaxLayoutWidth = DefaultInfo.instance.getScreenWidth() - 30.0
    }
    
}
