//
//  HLList.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLList: HLItem {
    var title: NSString?
    var source: NSArray?
    
    init(json: NSDictionary) {
        title = json.valueForKey("title") as? NSString
        source = json.valueForKey("source") as? NSArray
    }
}