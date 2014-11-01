//
//  Wassail_v1.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation

private let _Wassail_v1SharedInstance = Wassail_v1()

class Wassail_v1: NSObject {
    
    class var instance : Wassail_v1 {
        return _Wassail_v1SharedInstance
    }
    
    // MARK: - others

    func getApplyStats(programInstanceId: NSNumber) {
    
}

    // MARK: - others
    
    func sendFeedback(text: NSString, completion: NormalClosure) {
        
        let api: NSString = "/others/feedback"
        
        let body: NSMutableDictionary = NSMutableDictionary()
        body.setObject(text, forKey: "message")
        
        CloudAdapter.instance.post(api, body: body, completion)
    }
    
    func getApplyStats(programInstanceId: NSNumber, completion: NormalClosure) {
        
        let api: NSString = "/apply/getApplyStats"
        
        let body: NSMutableDictionary = NSMutableDictionary()
        body.setObject(programInstanceId, forKey: "programInstanceId")
        
        CloudAdapter.instance.get(api, body: body, completion)
    }
}
