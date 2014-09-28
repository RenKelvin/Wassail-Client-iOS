//
//  HLToolPreviewView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLToolPreviewView: UIView {
    
    @IBOutlet var iconImageView: UIImageView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var noteLabel: UILabel?
    @IBOutlet var readyLabel: UILabel?
    
    func configure(dict: NSDictionary?) {
        if (dict == nil) {
            return
        }
        
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
    }
    
}
