//
//  ApplyAccessor.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ApplyAccessorSharedInstance = ApplyAccessor()

class ApplyAccessor: NSObject {
    
    class var instance : ApplyAccessor {
        return _ApplyAccessorSharedInstance
    }
    
    func getProgramInstancePreviewList() -> NSArray? {
        return DatabaseMediator.instance.getProgramInstancePreviewList()
    }
    
}
