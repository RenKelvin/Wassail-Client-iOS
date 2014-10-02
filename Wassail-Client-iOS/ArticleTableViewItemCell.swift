//
//  ArticleTableViewItemCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ArticleTableViewItemCell: ArticleTableViewCell {
    
    var itemView: HLItemView?
    @IBOutlet var containerView: UIView?
    
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
            
            let toolPreviewBody = item!.objectForKey("body") as NSDictionary
            let toolName = toolPreviewBody.objectForKey("address") as NSString
            let tool = ToolsInfo.instance.getTool(toolName) as NSDictionary?
            
            itemView!.controller = controller
            itemView!.configure(tool)
            
        case "HLLink":
            itemView = NSBundle.mainBundle().loadNibNamed("HLLinkView", owner: nil, options: nil).first as HLLinkView
            
            let linkBody = item!.objectForKey("body") as NSDictionary
            
            itemView!.controller = controller
            itemView!.configure(linkBody)
            
        case "HLImg":
            itemView = NSBundle.mainBundle().loadNibNamed("HLImageView", owner: nil, options: nil).first as HLImageView
            
            let imageBody = item!.objectForKey("body") as NSDictionary
            
            itemView!.configure(imageBody)
            
        case "HLImage":
            itemView = NSBundle.mainBundle().loadNibNamed("HLImageView", owner: nil, options: nil).first as HLImageView
            
            let imageBody = item!.objectForKey("body") as NSDictionary
            
            itemView!.configure(imageBody)

        default:
            return
        }
        
        // Add subview
        containerView!.addSubview(itemView!)
        
        // Disable TranslatesAutoresizingMaskIntoConstraints
        containerView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        itemView!.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Add constraints
        let upConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        containerView!.addConstraint(upConstraint)
        
        let downConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        containerView!.addConstraint(downConstraint)
        
        let leftConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        containerView!.addConstraint(leftConstraint)
        
        let rightConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        containerView!.addConstraint(rightConstraint)
        
        //        let midXConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        //        containerView!.addConstraint(midXConstraint)
        
        //        let midYConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        //        containerView!.addConstraint(midYConstraint)
        
        //        let heightConstraint = NSLayoutConstraint(item: itemView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: containerView!, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        //        containerView!.addConstraint(upConstraint)
    }
    
}
