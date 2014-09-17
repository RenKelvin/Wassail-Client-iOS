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
    
    func getItem(name: NSString) -> HLItem? {
        var raw = DefaultMapper.instance.getItem(name)
        
        if (raw == nil) {
            println("DefaultAccessor.getItem: \(name) - Failed!")
            return nil
        }
        
        return HLItemBuilder.build(raw!)
    }
    
    func getTools() -> NSDictionary? {
        return DefaultMapper.instance.getTools()
    }
    
    func getSizeConverter() -> NSDictionary? {
        return DefaultMapper.instance.getSizeConverter()
    }

    func getUnitConverter() -> NSDictionary? {
        return DefaultMapper.instance.getUnitConverter()
    }
}