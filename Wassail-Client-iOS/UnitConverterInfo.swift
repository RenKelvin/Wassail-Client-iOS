//
//  UnitConverterInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/16/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _UnitConverterInfoSharedInstance = UnitConverterInfo()

class UnitConverterInfo: NSObject {
    
    var data: NSDictionary?
    
    class var instance : UnitConverterInfo {
    return _UnitConverterInfoSharedInstance
    }
    
    func reloadData() {
        data = DefaultAccessor.instance.getUnitConverter() as NSDictionary?
    }
    
    func numberOfCategories() -> Int {
        if (data == nil) {
            return 0
        }
        
        return self.getNames()!.count
    }
    
    func getCategory(name: String) -> NSDictionary? {
        if (data == nil) {
            return nil
        }
        
        return data!.objectForKey(name) as? NSDictionary
    }
    
    func getNames() -> NSArray? {
        if (data == nil) {
            return nil
        }
        
        return data!.objectForKey("names") as? NSArray
    }
    
}