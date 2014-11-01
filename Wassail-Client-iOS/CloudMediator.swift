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
            
            callback(success: false) // TODO: success
        }
        
        CloudAdapter.instance.sendFeedback(text, completion)
    }
    
    // MARK: - Apply
    
    func getApplyStats(programInstanceId: NSNumber, callback: (success: Bool, data: NSDictionary?) -> Void) {
        
        let completion = {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(data)
            println(response)
            println(error)
            
            let dict: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as? NSDictionary
            
            if (response == nil || dict == nil || (response! as NSHTTPURLResponse).statusCode == 200) {
                callback(success: false, data: nil)
            }
            else {
                callback(success: true, data: dict!)
            }
        }
        
        CloudAdapter.instance.getApplyStats(programInstanceId, completion)
    }
    
    // MARK: - University
    
    func getUniversityRanking(name: NSString, callback: (success: Bool, list: HLList?) -> Void) {
        
        let completion = {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println(data)
            println(response)
            println(error)
            
            let dict: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as? NSDictionary
            
            if (response == nil || dict == nil || (response! as NSHTTPURLResponse).statusCode == 200) {
//                callback(success: false, list: nil)
                let l = ListInfo.instance.getList("1.1美国大学排名")
                                callback(success: true, list: l)
            }
            else {
                
                let list = HLItemBuilder.build(dict!)
                if (list != nil && list!.isKindOfClass(HLList)) {
                    callback(success: true, list: list as? HLList)
                }
                else {
                    callback(success: false, list: nil)
                }
                
            }
        }
        
        CloudAdapter.instance.getUniversityRanking(name, completion)
    }
    
}