//
//  HLItemPreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLItemPreview: HLItem {

    var icon: HLImage?
    var title: NSString?
    var note: NSString?

    var address: NSString?
    var sourceType: NSString?

    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Body
        let jsonBody = json.objectForKey("body") as! NSDictionary

        title = jsonBody.objectForKey("title") as? NSString
        note = jsonBody.objectForKey("note") as? NSString
        
        address = jsonBody.objectForKey("address") as? NSString
        
        let iconDict = jsonBody.objectForKey("icon") as? NSDictionary
        if (iconDict != nil) {
            icon = HLItemBuilder.build(iconDict!) as? HLImage
        }
    }

}
