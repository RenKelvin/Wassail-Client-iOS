//
//  HLListPreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLListPreview: HLItemPreview {
    
    var title: NSString = ""
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Header
        name = json.objectForKey("name") as NSString
        
        // Body
        let jsonBody = json.objectForKey("body") as NSDictionary
        title = jsonBody.objectForKey("title") as NSString
    }
    
    // MARK: HLItemPreview Methods
    
    override func titlePresent() -> NSString {
        return title
    }
    
    
}