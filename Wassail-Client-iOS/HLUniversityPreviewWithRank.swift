//
//  HLUniversityPreviewWithRank.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/26/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLUniversityPreviewWithRank: HLItemPreview {
   
    var chineseName: NSString?
    var score: Double?
    var rank: Int?

    override init(json: NSDictionary) {
        super.init(json: json)
        
        sourceType = "University"
        
        let j = JSON(json)
        let jsonBody = json.objectForKey("body") as NSDictionary
        chineseName = j["body"]["chineseName"].stringValue
        score = j["body"]["score"].doubleValue
        rank = j["body"]["rank"].intValue
    }
    

}
