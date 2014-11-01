//
//  CloudAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/9/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

typealias NormalClosure = (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void

private let _CloudAdapterSharedInstance = CloudAdapter()

class CloudAdapter: NSObject, NSURLSessionTaskDelegate {
    
    let version: Int = 1
    
    let scheme: NSString = "http"
    let host: NSString = "haile.elasticbeanstalk.com"
    let path: NSString = "/api/v"   // For example: "/api/v1"
    
    class var instance : CloudAdapter {
        return _CloudAdapterSharedInstance
    }
    
    func sendFeedback(text: NSString, completion: NormalClosure) {
        Wassail_v1.instance.sendFeedback(text, completion)
    }

    func getApplyStats(programInstanceId: NSNumber, completion: NormalClosure) {
        Wassail_v1.instance.getApplyStats(programInstanceId, completion)
    }

    func getUniversityRanking(name: NSString, completion: NormalClosure) {
        Wassail_v1.instance.getUniversityRanking(name, completion)
    }

    // MARK: -
    
    func post(api: NSString, body: NSDictionary, completion: NormalClosure) {
        
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
            let object: AnyObject? = body.objectForKey(key as NSString)
            bodyArray.addObject(NSString(format: "\(key as NSString)=\(object)"))
        }
        
        var bodyString = bodyArray.componentsJoinedByString("&")
        let bodyData = bodyString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // Add body
        request.HTTPBody = bodyData
        
        // Create data task
        let task = session.dataTaskWithRequest(request, completionHandler: completion)
        
        // Do the task
        task.resume()
    }

    
    func get(api: NSString, body: NSDictionary, completion: NormalClosure) {
        
        // Create session
        var session = NSURLSession.sharedSession()
        
        // Create URL
        var url = NSURL(scheme: scheme, host: host, path: path+String(version)+api)
        
        // Create request
        var request = NSMutableURLRequest()
        request.URL = url
        request.HTTPMethod = "GET"
        
        // Convert body
        var bodyArray = NSMutableArray()
        for key in body.allKeys {
            let object: AnyObject? = body.objectForKey(key as NSString)
            bodyArray.addObject(NSString(format: "\(key as NSString)=\(object)"))
        }
        
        var bodyString = bodyArray.componentsJoinedByString("&")
        let bodyData = bodyString.dataUsingEncoding(NSUTF8StringEncoding)
        
        // Add body
        request.HTTPBody = bodyData
        
        // Create data task
        let task = session.dataTaskWithRequest(request, completionHandler: completion)
        
        // Do the task
        task.resume()
    }
    
}
