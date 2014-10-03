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
    
    override func configure(dict: NSDictionary?) {
        
        if (dict == nil) {
            return
        }
        
        let name = dict!.objectForKey("address") as NSString
        let image = DefaultInfo.instance.getImage(name) as UIImage?
        if (image == nil) {
            return
        }
        
        let scale = image!.size.width / image!.size.height
        let width = DefaultInfo.instance.getScreenWidth() - 30.0
        let height = width / scale
        
        imageView!.image = image!.scaledToSize(CGSizeMake(width, height))
        
    }
    
}
