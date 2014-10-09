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
    
    // MARK: -
    
    func sendFeedback(text: NSString) {
        
        let api: NSString = "/others/feedback"
        
        let body: NSMutableDictionary = NSMutableDictionary()
        
        body.setObject(text, forKey: "message")
        
        self.post(api, body: body)
    }
    
    // MARK: -
    
    func post(api: NSString, body: NSDictionary) {
        
        // Create session
        var session = NSURLSession.sharedSession()
        
        // Create URL
        var url = NSURL(scheme: scheme, host: host, path: "/api/v1/others/feedback")
        
        // Create request
        var request = NSMutableURLRequest()
        request.URL = url
        request.HTTPMethod = "POST"
        
        // Convert body
        var bodyArray = NSMutableArray()
        for key in body.allKeys {
            let object = body.objectForKey(key as NSString) as NSString
            bodyArray.addObject(NSString(format: "\(key as NSString)=\(object)"))
        }
        
        var bodyString = bodyArray.componentsJoinedByString("&")
        let bodyData = bodyString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // Add body
        request.HTTPBody = bodyData
        
        // Create data task
        let task = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                // TODO: response handler
                println(data)
                println(response)
                println(error)
        })
        
        // Do the task
        task.resume()
    }
    
}