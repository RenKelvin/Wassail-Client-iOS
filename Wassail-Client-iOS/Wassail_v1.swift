//
//  Wassail-SDK-iOS-v1.swift
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
    
    let scheme: NSString = "http"
    let host: NSString = "haile.elasticbeanstalk.com"
    let path: NSString = "/api/v1"
    
    func sendFeedback(text: NSString) {
        
        let api: NSString = "/others/feedback"
        
        let body: NSMutableDictionary = NSMutableDictionary()
        body.setObject(text, forKey: "Msg")
        
        self.post(api, body: body)
    }
    
    
    func post(api: NSString, body: NSDictionary) {
        
        var session = NSURLSession.sharedSession()
        
        var url = NSURL(scheme: scheme, host: host, path: "/api/v1/others/feedback")
        
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(body, options: nil, error: nil)

        let task = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                println(data)
                println(response)
                println(error)
        })
        
        task.resume()
    }
    
}