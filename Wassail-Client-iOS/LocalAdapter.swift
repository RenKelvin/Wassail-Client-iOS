//
//  LocalAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _LocalAdapterSharedInstance = LocalAdapter()

class LocalAdapter: NSObject {
    
    class var instance : LocalAdapter {
    return _LocalAdapterSharedInstance
    }
    
    func get(file: String, type: String) -> NSDictionary? {
        //
        let path = NSBundle.mainBundle().pathForResource(file, ofType: type)
        let data = NSData(contentsOfFile: path!)
        
        var error: NSError? = NSError()
        let json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary?
        
//        let bodyDict: NSDictionary? = json?.objectForKey("body") as? NSDictionary
//        println(bodyDict)
//        
//        let sourceArray: NSArray? = bodyDict?.objectForKey("source") as? NSArray
//        println(sourceArray)
//        
//        let group1: NSDictionary? = sourceArray?.objectAtIndex(0) as? NSDictionary
//        println(group1)
//        
//        let items1: NSArray? = group1?.objectForKey("items") as? NSArray
//        println(items1)
        
        //
        return json
    }
    
}
