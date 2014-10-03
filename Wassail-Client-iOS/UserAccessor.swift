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
    
    func getMySize(key: String) -> NSDictionary? {
        
        return LocalMediator.instance.getMySize(key)
    }

    func setMySize(key: NSString, value: NSDictionary) -> Bool {
        
        return LocalMediator.instance.setMySize(key, value: value)
    }
    
    func getMyGPA() -> Double? {
        
        return LocalMediator.instance.getMyGPA()
    }
    
    func setMyGPA(gpa: Double?) -> Bool {
        
        return LocalMediator.instance.setMyGPA(gpa)
    }

}
