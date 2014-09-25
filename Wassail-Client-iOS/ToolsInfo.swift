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
    
    func getTools() -> NSDictionary? {
        return DefaultAccessor.instance.getTools()
    }
    
    func getApplyTools() -> NSArray? {
        let tools = self.getTools()
        
        if (tools == nil) {
            return nil
        }
        
        let applyTools = tools!.objectForKey("apply tools") as NSArray
        
        return applyTools
    }
    
    func getAboardTools() -> NSArray? {
        let tools = self.getTools()
        
        if (tools == nil) {
            return nil
        }
        
        let aboardTools = tools!.objectForKey("aboard tools") as NSArray
        
        return aboardTools
    }
    
    func getTool(section: Int, row: Int) -> NSDictionary? {
        let tools = self.getTools()
        
        if (tools == nil) {
            return nil
        }
        
        if (section == 0) {
            let toolsArray = tools!.objectForKey("apply tools") as NSArray
            return toolsArray.objectAtIndex(row) as? NSDictionary
        }
        else {
            let toolsArray = tools!.objectForKey("aboard tools") as NSArray
            return toolsArray.objectAtIndex(row) as? NSDictionary
        }
    }
    
}
