//
//  HLLinkView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLLinkView: HLItemView {
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    
    var link: NSDictionary?
    
    override func configure(dict: NSDictionary?) {
        
        if (dict == nil) {
            return
        }
        
        self.link = dict
        
        titleLabel!.text = dict!.objectForKey("title") as! String?
        //        noteLabel!.text = dict!.objectForKey("note") as String?
        
    }
    
    @IBAction func tapHandler() {
        
        if (self.link == nil || self.controller == nil) {
            return
        }
        
        let identifier = "Article" + "Browser" + "SegueIdentifier"
        
        let address = link!.objectForKey("address") as! NSString
        
        self.controller!.performSegueWithIdentifier(identifier, sender: address)
    }
}
