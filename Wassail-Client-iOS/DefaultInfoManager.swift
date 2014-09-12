//
//  DefaultInfoManager.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultInfoManagerSharedInstance = DefaultInfoManager()

class DefaultInfoManager: NSObject {
    
    class var instance : DefaultInfoManager {
    return _DefaultInfoManagerSharedInstance
    }
    
    func getList(name: String) -> HLList {
        return HLList(json: DefaultInfoMapper.instance.getList(name))
    }
    
    func getTools() -> NSDictionary {
        return DefaultInfoMapper.instance.getTools()
    }
}