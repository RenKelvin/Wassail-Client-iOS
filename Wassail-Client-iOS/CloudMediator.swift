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
 
   // MARK: -

    func sendFeedback(text: NSString, callback: (success: Bool) -> Void) {
        
        let completion = {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(data)
            println(response)
            println(error)

            callback(success: false)
        }

        CloudAdapter.instance.sendFeedback(text, completion)
    }

    // MARK: - Apply

    func getApplyStats(programInstanceId: NSNumber) {
    
    
    }
    
}