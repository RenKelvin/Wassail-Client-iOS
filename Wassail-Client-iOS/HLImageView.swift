//
//  HLImageView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLImageView: HLItemView {
    
    @IBOutlet var imageView: UIImageView?
    
    var image: NSDictionary?
    
    override func configure(dict: NSDictionary?) {
        
        if (dict == nil) {
            return
        }
        
        self.image = dict
        
        let name = dict!.objectForKey("address") as NSString
        self.imageView!.image = DefaultInfo.instance.getImage(name)
        
        self.sizeToFit()
        println(self.sizeThatFits(self.frame.size))
    }
    
}
