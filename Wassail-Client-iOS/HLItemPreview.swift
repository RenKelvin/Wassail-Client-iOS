//
//  HLItemPreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLItemPreview: HLItem {

    var title: NSString?
    var address: NSString?
    var icon: HLImage?
    var note: NSString?

    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Body
        let jsonBody = json.objectForKey("body") as NSDictionary
        title = jsonBody.objectForKey("title") as? NSString
        address = jsonBody.objectForKey("address") as? NSString
        note = jsonBody.objectForKey("note") as? NSString
        
        let iconDict = jsonBody.objectForKey("icon") as? NSDictionary
        if (iconDict != nil) {
            icon = HLItemBuilder.build(iconDict!) as? HLImage
        }
    }

}
