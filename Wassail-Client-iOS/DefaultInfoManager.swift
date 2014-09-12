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
    
    func getList() -> HLList {
        return DefaultInfoMapper.instance.getList()
    }
}