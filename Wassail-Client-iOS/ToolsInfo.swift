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
        
        let applyTools = (tools!.objectForKey("names") as NSArray).objectAtIndex(0) as NSArray
        
        return applyTools
    }
    
    func getAbroadTools() -> NSArray? {
        let tools = self.getTools()
        
        if (tools == nil) {
            return nil
        }
        
        let abroadTools = (tools!.objectForKey("names") as NSArray).objectAtIndex(1) as NSArray
        
        return abroadTools
    }
    
    func getTool(section: Int, row: Int) -> NSDictionary? {
        let tools = self.getTools()
        
        if (tools == nil) {
            return nil
        }
        
        let name = ((tools!.objectForKey("names") as NSArray).objectAtIndex(section) as NSArray).objectAtIndex(row) as NSString
        
        return self.getTool(name)
    }
    
    func getTool(name: NSString) -> NSDictionary? {
        let tools = self.getTools()
        
        if (tools == nil) {
            return nil
        }
        
        return tools!.objectForKey(name) as? NSDictionary
    }
    
}
