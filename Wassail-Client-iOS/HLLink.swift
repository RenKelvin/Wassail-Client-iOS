//
//  HLLink.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLLink: HLItemPreview {
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Body
        let jsonBody = json.objectForKey("body") as! NSDictionary
        
        title = jsonBody.objectForKey("title") as? NSString
        address = jsonBody.objectForKey("address") as? NSString
        
        sourceType = "Browser"
    }
}