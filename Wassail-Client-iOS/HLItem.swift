//
//  HLItem.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLItem: Item {
    
    var name: NSString = ""
    var type: NSString = "HLItem"

    override init() {
        super.init()
    }

    // Virtual method
    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Header
        name = json.objectForKey("name") as! NSString
        type = json.objectForKey("type") as! NSString
    }

}
