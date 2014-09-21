//
//  LocalMediator.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _LocalMediatorSharedInstance = LocalMediator()

class LocalMediator: NSObject {
    
    class var instance : LocalMediator {
    return _LocalMediatorSharedInstance
    }
    
    func getTools() -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getJson("Tools", dir: .Bundle)
        
        return dict
    }
    
    func getSizeConverter() -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getJson("Size Converter", dir: .Bundle)
        
        return dict
    }
    
    func getUnitConverter() -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getJson("Unit Converter", dir: .Bundle)
        
        return dict
    }
    
    func getMySize(key: String) -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getPlist("User", dir: .Document)
        if (dict == nil) {
            return nil
        }
        
        let size = dict!.objectForKey(key) as NSDictionary?
        
        return size
    }
    
    func setMySize(key: NSString, value: NSDictionary) -> Bool {
        
        return LocalAdapter.instance.writePlist("User", key: key, value: value)
    }
}