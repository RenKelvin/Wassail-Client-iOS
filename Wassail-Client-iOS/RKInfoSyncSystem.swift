//
//  RKInfoSyncSystem.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _RKInfoSyncSystemSharedInstance = RKInfoSyncSystem()

class RKInfoSyncSystem: NSObject {
    
    class var instance : RKInfoSyncSystem {
    return _RKInfoSyncSystemSharedInstance
    }
    
    func apply(cloud: AnyObject?, db: AnyObject?, local: AnyObject?) -> AnyObject? {
        return local
    }
    
}
