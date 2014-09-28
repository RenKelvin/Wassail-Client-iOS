//
//  ArticleTableViewItemCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleTableViewItemCell: ArticleTableViewCell {
    
    @IBOutlet var itemView: UIView?
    
    override func configure(item: NSDictionary) {
        
        var view: UIView?
        
        let type = item.objectForKey("type") as NSString
        switch type {
            
        case "HLToolPreview":
            view = NSBundle.mainBundle().loadNibNamed("HLToolPreviewView", owner: nil, options: nil).first as HLToolPreviewView
            //            view.configure(item)
            
        default:
            ""
        }
        
        // Add constraints
        
        // Add subview
        itemView!.addSubview(view!)
        
    }
    
}
