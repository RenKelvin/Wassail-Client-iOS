//
//  HLArticlePreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLArticlePreview: HLItemPreview {
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        sourceType = "Article"
    }
    
}
