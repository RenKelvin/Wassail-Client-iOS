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
    
    var itemView: HLItemView?
    
    override func configure(item: NSDictionary?) {
        
        if (itemView != nil) {
            itemView!.removeFromSuperview()
        }
        
        if (item == nil) {
            return
        }
        
        let type = item!.objectForKey("type") as NSString?
        
        if (type == nil) {
            
            println("ArticleTableViewCell configure: type == nil")
            
            return
        }
        
        switch type! {
            
        case "HLToolPreview":
            itemView = NSBundle.mainBundle().loadNibNamed("HLToolPreviewView", owner: nil, options: nil).first as HLToolPreviewView
            itemView!.frame.size.width = itemContainerView!.frame.width
            
            let toolPreviewBody = item!.objectForKey("body") as NSDictionary
            let toolName = toolPreviewBody.objectForKey("address") as NSString
            let tool = ToolsInfo.instance.getTool(toolName) as NSDictionary?
            
            itemView!.controller = controller
            itemView!.configure(tool)
            
        case "HLLink":
            itemView = NSBundle.mainBundle().loadNibNamed("HLLinkView", owner: nil, options: nil).first as HLLinkView
            itemView!.frame.size.width = itemContainerView!.frame.width
            
            let linkBody = item!.objectForKey("body") as NSDictionary
            
            itemView!.controller = controller
            itemView!.configure(linkBody)
            
        case "HLImg":
            itemView = NSBundle.mainBundle().loadNibNamed("HLImageView", owner: nil, options: nil).first as HLImageView
            
            let imageBody = item!.objectForKey("body") as NSDictionary
            
            itemView!.configure(imageBody)
            
            itemView!.frame.size.width = DefaultInfo.instance.getScreenWidth() - 30.0
            //            itemView!.frame.size = itemView!.sizeThatFits(itemView!.frame.size)
            //            println("itemview \(itemView!.frame.size)")
            //
            //            itemContainerView!.frame.size = itemView!.frame.size
            //            println("itemContainerView \(itemContainerView!.frame.size)")
            
        default:
            ""
        }
        // Add subview
        itemContainerView!.addSubview(itemView!)
        
        // Add constraints
        
        let upConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        itemContainerView!.addConstraint(upConstraint)
        
        let downConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: itemContainerView!, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        itemContainerView!.addConstraint(downConstraint)
    }
    
}
