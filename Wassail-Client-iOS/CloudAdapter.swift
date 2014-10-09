//
//  CloudAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/9/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _CloudAdapterSharedInstance = CloudAdapter()

class CloudAdapter: NSObject, NSURLSessionTaskDelegate {
    
    let version: Int = 1
    
    class var instance : CloudAdapter {
    return _CloudAdapterSharedInstance
    }
    
    func sendFeedback(text: NSString) {
        
        if (version == 1) {
            Wassail_v1.instance.sendFeedback(text)
        }
        
    }
    
}
