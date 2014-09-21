//
//  AWSAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _AWSAdapterSharedInstance = AWSAdapter()

class AWSAdapter: NSObject, NSURLSessionTaskDelegate {
    
    let version: Int = 1
    
    class var instance : AWSAdapter {
    return _AWSAdapterSharedInstance
    }
    
    func sendFeedback(text: NSString) {
        
        if (version == 1) {
            Wassail_v1.instance.sendFeedback(text)
        }
        
    }
    
    
}
