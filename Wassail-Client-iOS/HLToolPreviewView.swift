//
//  HLToolPreviewView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLToolPreviewView: HLItemView {
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var readyLabel: UILabel?
    
    var tool: NSDictionary?
    
    override func configure(dict: NSDictionary?) {
        
        if (dict == nil) {
            return
        }
        
        self.tool = dict
        
        iconImageView!.image = UIImage(named: dict!.objectForKey("icon") as String)
        titleLabel!.text = dict!.objectForKey("title") as String?
        noteLabel!.text = dict!.objectForKey("note") as String?
        
        let ready = dict!.objectForKey("ready") as NSString?
        if (ready == "false") {
            readyLabel!.hidden = false
        }
        else {
            readyLabel!.hidden = true
        }
        
        //
        //        self.frame.size.width = DefaultInfo.instance.getScreenWidth() - 30.0
        //        self.frame.size.height = 64.0
    }
    
    @IBAction func tapHandler() {
        
        let ready = self.tool!.objectForKey("ready") as NSString
        if (ready == "false") {
            return
        }
        
        if (self.tool == nil || self.controller == nil) {
            return
        }
        
        //
        let identifier = "Article" + (tool!.objectForKey("identifier") as NSString) + "SegueIdentifier"
        
        //
        var sender: NSDictionary
        let title = tool!.objectForKey("title") as NSString
        
        
        if (title == "信用卡") {
            controller!.performSegueWithIdentifier("ArticleListSugueIdentifier", sender: "1.0信用卡")
        }
        else if (title == "大学排名") {
            controller!.performSegueWithIdentifier("ArticleListSugueIdentifier", sender: "0大学排名")
        }
        else if (title == "留学常用词汇") {
            controller!.performSegueWithIdentifier("ArticleArticleSugueIdentifier", sender: "留学常用词汇")
        }
        else if (title == "申请文书") {
            controller!.performSegueWithIdentifier("ArticleListSugueIdentifier", sender: "0申请文书")
        }
        else {
            controller!.performSegueWithIdentifier(identifier, sender: nil)
        }
    }
    
}
