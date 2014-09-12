//
//  RKInfoSysnSystem.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _RKInfoSysnSystemSharedInstance = RKInfoSysnSystem()

class RKInfoSysnSystem: NSObject {
    
    class var instance : RKInfoSysnSystem {
    return _RKInfoSysnSystemSharedInstance
    }
    
    func apply(cloud: AnyObject?, db: AnyObject?, local: AnyObject?) -> AnyObject? {
        return local
    }
    
}
