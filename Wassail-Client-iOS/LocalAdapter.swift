//
//  LocalAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit


enum Directory {
    case Bundle
    case Document
}

private let _LocalAdapterSharedInstance = LocalAdapter()

class LocalAdapter: NSObject {
    
    class var instance : LocalAdapter {
    return _LocalAdapterSharedInstance
    }
    
    // MARK: -
    
    func createPlist(file: String) -> Bool {
        
        var url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
        url = url.URLByAppendingPathComponent(String(format: "\(file).plist"))
        
        if (!NSFileManager.defaultManager().fileExistsAtPath(url.path!)) {
            
            let dict = NSDictionary(dictionary: ["": ""])
            
            return dict.writeToURL(url, atomically: true)
        }
        
        return true
    }
    
    func writePlist(file: String, key: NSString, value: AnyObject) -> Bool {
        
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
    
    // MARK: -
    
    func getJson(file: String, dir: Directory) -> NSDictionary? {
        
        let url = self.getURL(file, type: "json", dir: dir)
        if (url == nil) {
            println("Local Adapter: \(file).json in not found in \(dir)")
            return nil
        }
        
        let data = NSData(contentsOfFile: url!.path!)
        var error: NSError? = NSError()
        let json: NSDictionary? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary?
        if (json == nil) {
            println("Local Adapter: \(file).json in \(dir) error")
            return nil
        }
        
        //
        return json
    }
    
    // MARK: -
    
    func getImage(file: String, dir: Directory) -> UIImage? {
        
        let path = file.stringByDeletingPathExtension as NSString
        let type = file.pathExtension as NSString
        let url = self.getURL(path, type: type, dir: dir)
        
        if (url == nil) {
            println("Local Adapter: \(file) not found in \(dir)")
            return nil
        }
        
        let image = UIImage(contentsOfFile: url!.path!)
        
        return image
    }
    
    func getImageURL(file: String, dir: Directory) -> NSURL? {
        
        let path = file.stringByDeletingPathExtension as NSString
        let type = file.pathExtension as NSString
        let url = self.getURL(path, type: type, dir: dir)
        
        if (url == nil) {
            println("Local Adapter: \(file) not found in \(dir)")
            return nil
        }
        
        return url
    }
    
    // MARK: -
    
    func getURL(path: String, type: String, dir: Directory) -> NSURL? {
        
        var url: NSURL?
        
        switch dir {
        case .Bundle:
            url = NSBundle.mainBundle().URLForResource(path, withExtension: type)
            
        case .Document:
            url = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as? NSURL
            url = url?.URLByAppendingPathComponent(String(format: "\(path).\(type)"))
            
        default:
            url = nil
            
        }
        
        return url
    }
    
}
