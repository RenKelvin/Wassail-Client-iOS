//
//  DefaultAccessor.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultAccessorSharedInstance = DefaultAccessor()

class DefaultAccessor: NSObject {
    
    class var instance : DefaultAccessor {
    return _DefaultAccessorSharedInstance
    }
    
    func getList(name: String) -> HLList? {
        var raw = DefaultMapper.instance.getList(name)
        
        if (raw == nil) {
            println("Load info failed!")
            return nil
        }
        
        return HLList(json: raw!)
    }
    
    func getTools() -> NSDictionary {
        return DefaultMapper.instance.getTools()
    }
}