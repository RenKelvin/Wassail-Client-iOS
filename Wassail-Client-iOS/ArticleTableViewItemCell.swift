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
            //            view.configure(item)
            
        case "HLLink":
            itemView = NSBundle.mainBundle().loadNibNamed("HLLinkView", owner: nil, options: nil).first as HLLinkView
            itemView!.frame.size.width = itemContainerView!.frame.width
            //            view.configure(item)
            
        case "HLImg":
            itemView = NSBundle.mainBundle().loadNibNamed("HLImageView", owner: nil, options: nil).first as HLImageView
            itemView!.frame.size.width = itemContainerView!.frame.width
            //            view.configure(item)
            
        default:
            ""
        }
        // Add subview
        itemContainerView!.addSubview(itemView!)
        
        // Add constraints
        //        let leftConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        //        itemContainerView!.addConstraint(leftConstraint)
        //
        //        let rightConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        //        itemContainerView!.addConstraint(rightConstraint)
        
        let upConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        itemContainerView!.addConstraint(upConstraint)
        
        let downConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        itemContainerView!.addConstraint(downConstraint)
        
    }
    
}
