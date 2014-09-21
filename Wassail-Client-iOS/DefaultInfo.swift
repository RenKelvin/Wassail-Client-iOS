//
//  DefaultInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultInfoSharedInstance = DefaultInfo()

class DefaultInfo: NSObject {
    
    class var instance : DefaultInfo {
    return _DefaultInfoSharedInstance
    }
    
    func getItem(name: NSString) -> HLItem? {
        return DefaultAccessor.instance.getItem(name)
    }
    
}
