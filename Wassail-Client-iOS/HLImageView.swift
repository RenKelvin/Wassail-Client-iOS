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
        
        // TODO: add image
    }
    
}
