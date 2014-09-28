//
//  HLItemBuilder.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLItemBuilder: NSObject {
    
    class func build(json: NSDictionary) -> HLItem {
        let type = json.objectForKey("type") as NSString
        let name = json.objectForKey("name") as NSString
        
        switch type {
            
        case "HLList": return HLList(json: json)
            
        case "HLListPreview": return HLListPreview(json: json)
            
        case "HLArticle": return HLArticle(json: json)
            
        case "HLArticlePreview": return HLArticlePreview(json: json)

        case "HLLink": return HLLink(json: json)

        default: return HLItem()
        }
    }
}
