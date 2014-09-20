//
//  UserAccessor.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/20/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _UserAccessorSharedInstance = UserAccessor()

class UserAccessor: NSObject {
    
    class var instance : UserAccessor {
    return _UserAccessorSharedInstance
    }
    
    func getMySize() -> NSDictionary? {
        return UserMapper.instance.getMySize()
    }

}
