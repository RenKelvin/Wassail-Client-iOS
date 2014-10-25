//
//  Wassail.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation

private let _WassailSharedInstance = Wassail()

class Wassail: NSObject {
    
    class var instance : Wassail {
        return _WassailSharedInstance
    }
    
    // MARK: -
    
    func sendFeedback(version: Int, text: NSString) {
        
        switch version {
        case 1:
            let api: NSString = "/others/feedback"
            
            let body: NSMutableDictionary = NSMutableDictionary()
            body.setObject(text, forKey: "message")
            
            CloudAdapter.instance.post(api, body: body)
        default:
            ""
            
        }
    }
    
}