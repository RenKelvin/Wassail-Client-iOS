//
//  AWSMediator.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _AWSMediatorSharedInstance = AWSMediator()

class AWSMediator: NSObject {
    
    class var instance : AWSMediator {
    return _AWSMediatorSharedInstance
    }
    
    func sendFeedback(text: NSString) {
        AWSAdapter.instance.sendFeedback(text)
    }
    
}