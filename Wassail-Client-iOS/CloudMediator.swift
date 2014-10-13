//
//  CloudMediator.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _CloudMediatorSharedInstance = CloudMediator()

class CloudMediator: NSObject {
    
    class var instance : CloudMediator {
    return _CloudMediatorSharedInstance
    }
    
    func sendFeedback(text: NSString) {
        CloudAdapter.instance.sendFeedback(text)
    }
    
}