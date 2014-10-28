//
//  ApplyAdderInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/26/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ApplyAdderInfoSharedInstance = ApplyAdderInfo()

class ApplyAdderInfo: NSObject {
    
    var data: NSArray?
    
    class var instance : ApplyAdderInfo {
        return _ApplyAdderInfoSharedInstance
    }
    
    // MARK: -
    
    func getAllPrograms() -> NSArray? {
        
        if (data == nil) {
            data = ApplyAccessor.instance.getProgramInstancePreviewList()
        }
        
        return data
    }
    
}
