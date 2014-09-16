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
        if (path == nil) {
            println("\(file).\(type) not found")
            return nil
        }
        
        let data = NSData(contentsOfFile: path!)
        var error: NSError? = NSError()
        let json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary?
        if (json == nil) {
            println("\(file).\(type) json error")
            return nil
        }
        
        //
        return json
    }
    
}
