//
//  ToolsInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ToolsInfoSharedInstance = ToolsInfo()

class ToolsInfo: NSObject {
    
    class var instance : ToolsInfo {
    return _ToolsInfoSharedInstance
    }
    
    func getTools() -> NSDictionary {
        return DefaultAccessor.instance.getTools()
    }
}
