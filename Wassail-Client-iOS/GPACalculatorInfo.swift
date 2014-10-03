//
//  GPACalculatorInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/3/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _GPACalculatorInfoSharedInstance = GPACalculatorInfo()

class GPACalculatorInfo: NSObject {
    
    class var instance : GPACalculatorInfo {
    return _GPACalculatorInfoSharedInstance
    }
    
    func getMyGPA() -> Double? {
        
        let key = NSString(format: "mygpa")
        
        return UserAccessor.instance.getMyGPA()
        
    }
    
    func setMyGPA(gpa: Double?) -> Bool {
        
        if (gpa == nil) {
            return false
        }
        
        let key = NSString(format: "mygpa")
        let value = gpa!
        
        return UserAccessor.instance.setMyGPA(gpa)
    }
    
}