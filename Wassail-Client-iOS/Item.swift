//
//  Item.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/4/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var kind: NSString?
    var content: AnyObject?
    
    override init() {
        super.init()
    }
    
    init(json: NSDictionary) {
        kind = json.objectForKey("kind") as? NSString
        content = json.objectForKey("content")
    }
    
}
