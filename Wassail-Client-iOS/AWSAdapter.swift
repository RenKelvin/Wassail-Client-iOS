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
    
    class var instance : AWSAdapter {
    return _AWSAdapterSharedInstance
    }
    
    let scheme: NSString = "http"
    let host: NSString = "haile.elasticbeanstalk.com"
    let version: NSString = "api/v1"
    let api: NSString = "others/feedback"
    
    func testpost() {
        
        var session = NSURLSession.sharedSession()
        
        var url = NSURL(scheme: scheme, host: host, path: "/api/v1/others/feedback")
        var request = NSMutableURLRequest(URL: url)
        request.setValue("test feedback", forHTTPHeaderField: "msg")
        request.HTTPMethod = "POST"
        
        let task = session.dataTaskWithRequest(request, completionHandler:
            {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
                println(data)
                println(response)
                println(error)
        })
        
        task.resume()
    }
    
    // MARK: - NSURLSessionTaskDelegate
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, error: NSError?) {
        println(error)
    }
    
}
