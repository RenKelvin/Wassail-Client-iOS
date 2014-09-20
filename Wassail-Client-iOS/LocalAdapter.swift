//
//  LocalAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _LocalAdapterSharedInstance = LocalAdapter()

enum Directory {
    case Bundle
    case Document
}

class LocalAdapter: NSObject {
    
    class var instance : LocalAdapter {
    return _LocalAdapterSharedInstance
    }
    
    func getTools() -> NSDictionary? {
        
        let dict = self.getJson("Tools", dir: .Bundle)
        
        return dict
    }
    
    func getSizeConverter() -> NSDictionary? {
        
        let dict = self.getJson("Size Converter", dir: .Bundle)
        
        return dict
    }
    
    func getUnitConverter() -> NSDictionary? {
        
        let dict = self.getJson("Unit Converter", dir: .Bundle)
        
        return dict
    }
    
    func getMySize(key: String) -> NSDictionary? {
        
        let dict = self.getPlist("User", dir: .Document)
        if (dict == nil) {
            return nil
        }
        
        let size = dict!.objectForKey(key) as NSDictionary?
        
        return size
    }
    
    func setMySize(key: NSString, value: NSDictionary) -> Bool {
        
        return self.writePlist("User", key: key, value: value)
    }
    
    ////////
    
    func createPlist(file: String) -> Bool {
        
        var url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
        url = url.URLByAppendingPathComponent(String(format: "\(file).plist"))
        
        if (!NSFileManager.defaultManager().fileExistsAtPath(url.path!)) {
            
            let dict = NSDictionary(dictionary: ["": ""])
            
            return dict.writeToURL(url, atomically: true)
        }
        
        return true
    }
    
    func writePlist(file: String, key: NSString, value: NSDictionary) -> Bool {
        
        let url = getURL(file, type: "plist", dir: .Document)
        
        if (!NSFileManager.defaultManager().fileExistsAtPath(url!.path!)) {
            let b = self.createPlist(file)
            if (b == false) {
                return false
            }
        }
        
        let dict = self.getPlist(file, dir: .Document) as NSDictionary?
        if (dict == nil) {
            return false
        }
        
        var mdict = NSMutableDictionary(dictionary: dict! as Dictionary)
        mdict.setObject(value, forKey: key)
        
        mdict.writeToURL(url!, atomically: true)
        
        return true
    }
    
    func getPlist(file: String, dir: Directory) -> NSDictionary? {
        
        let url = self.getURL(file, type: "plist", dir: dir)
        if (url == nil) {
            println("Local Adapter: \(file).plist in not found in \(dir)")
            return nil
        }
        
        let dict = NSDictionary(contentsOfFile: url!.path!)
        
        return dict
    }
    
    func getJson(file: String, dir: Directory) -> NSDictionary? {
        
        let url = self.getURL(file, type: "json", dir: dir)
        if (url == nil) {
            println("Local Adapter: \(file).json in not found in \(dir)")
            return nil
        }
        
        let data = NSData(contentsOfFile: url!.path!)
        var error: NSError? = NSError()
        let json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary?
        if (json == nil) {
            println("Local Adapter: \(file).json in \(dir) error")
            return nil
        }
        
        //
        return json
    }
    
    func getURL(file: String, type: String, dir: Directory) -> NSURL? {
        
        var url: NSURL?
        
        switch dir {
        case .Bundle:
            url = NSBundle.mainBundle().URLForResource(file, withExtension: type)
            
        case .Document:
            url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as? NSURL
            url = url?.URLByAppendingPathComponent(String(format: "\(file).\(type)"))
            
        default:
            url = nil
            
        }
        
        return url
    }
    
}
