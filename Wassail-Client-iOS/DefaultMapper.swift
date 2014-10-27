//
//  DefaultMapper.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultMapperSharedInstance = DefaultMapper()

class DefaultMapper: NSObject {
    
    class var instance : DefaultMapper {
        return _DefaultMapperSharedInstance
    }
    
    func getItem(name: NSString) -> HLItem? {
        
        var local = LocalMediator.instance.getItem(name) as HLItem?
        
        return local
    }
    
}