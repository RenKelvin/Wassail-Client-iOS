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
    
    func getList(name: String) -> HLList {
        return HLList(json: DefaultMapper.instance.getList(name))
    }
    
    func getTools() -> NSDictionary {
        return DefaultMapper.instance.getTools()
    }
}