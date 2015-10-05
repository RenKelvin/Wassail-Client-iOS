//
//  ApplyManagerInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/26/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ApplyManagerInfoSharedInstance = ApplyManagerInfo()

class ApplyManagerInfo: NSObject {
    
    var data: NSArray?
    
    class var instance : ApplyManagerInfo {
        return _ApplyManagerInfoSharedInstance
    }
    
    func reloadData() {
        data = ApplyAccessor.instance.getApplyList()
    }
    
    func getAllApplies() -> NSArray? {
        return data
    }
}