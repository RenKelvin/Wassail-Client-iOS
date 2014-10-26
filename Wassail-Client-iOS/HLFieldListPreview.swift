//
//  HLFieldListPreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/26/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLFieldListPreview: HLItemPreview {
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        sourceType = "FieldList"
    }
    
}
