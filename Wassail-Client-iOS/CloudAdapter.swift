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
    
    let scheme: NSString = "http"
    let host: NSString = "haile.elasticbeanstalk.com"
    let path: NSString = "/api/v"       // For example: "/api/v1"
    
    class var instance : CloudAdapter {
        return _CloudAdapterSharedInstance
    }
    
    func sendFeedback(text: NSString) {
        Wassail_v1.instance.sendFeedback(text)
    }
    
    // MARK: -
    
    func post(api: NSString, body: NSDictionary) {
        
        // Create session
        var session = NSURLSession.sharedSession()
        
        // Create URL
        var url = NSURL(scheme: scheme, host: host, path: path+String(version)+api)
        
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
