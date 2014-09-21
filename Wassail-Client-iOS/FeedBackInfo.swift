//
//  FeedBackInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _FeedbackInfoSharedInstance = FeedbackInfo()

class FeedbackInfo: NSObject {
    
    var data: NSDictionary?
    
    class var instance : FeedbackInfo {
    return _FeedbackInfoSharedInstance
    }
 
    func sendFeedback(text: NSString) {
        DefaultAccessor.instance.sendFeedback(text)
    }
    
}