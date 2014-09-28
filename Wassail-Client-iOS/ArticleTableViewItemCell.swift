//
//  ArticleTableViewItemCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleTableViewItemCell: ArticleTableViewCell {
    
    @IBOutlet var itemContainerView: UIView?
    
    override func configure(item: NSDictionary) {
        
        var itemView: UIView?
        
        let type = item.objectForKey("type") as NSString
        switch type {
            
        case "HLToolPreview":
            itemView = NSBundle.mainBundle().loadNibNamed("HLToolPreviewView", owner: nil, options: nil).first as HLToolPreviewView
            itemView!.frame.size.width = itemContainerView!.frame.width
            itemView!.frame.size.height = 64.0
            //            view.configure(item)
            
        case "HLLinkPreview":
            itemView = NSBundle.mainBundle().loadNibNamed("HLLinkPreviewView", owner: nil, options: nil).first as HLLinkPreviewView
            itemView!.frame.size.width = itemContainerView!.frame.width
            itemView!.frame.size.height = 64.0
            //            view.configure(item)
            
        case "HLImg":
            itemView = NSBundle.mainBundle().loadNibNamed("HLImageView", owner: nil, options: nil).first as HLImageView
            //            view.configure(item)
            
        default:
            ""
        }
        
        // Add constraints
        //        let leftConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        //        itemView!.addConstraint(leftConstraint)
        //
        //        let rightConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        //        itemView!.addConstraint(rightConstraint)
        
        // Add subview
        itemContainerView!.addSubview(itemView!)
        
    }
    
}
