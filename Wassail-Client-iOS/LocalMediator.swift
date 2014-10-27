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
    
    func getItem(name: NSString) -> HLItem? {
        
        let json = LocalAdapter.instance.getJsonDict(name, dir: .Bundle)
        
        if (json == nil) {
            return nil
        }
        
        let item = HLItemBuilder.build(json!)
        
        return item
    }
    
    func getImage(name: NSString) -> UIImage? {
        
        let image = LocalAdapter.instance.getImage(name, dir: .Bundle)
        
        return image
    }
    
    func getImageURL(name: NSString) -> NSURL? {
        
        let url = LocalAdapter.instance.getImageURL(name, dir: .Bundle)
        
        return url
    }
    
    func getTools() -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getJsonDict("Tools", dir: .Bundle)
        
        return dict
    }
    
    func getSizeConverter() -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getJsonDict("Size Converter", dir: .Bundle)
        
        return dict
    }
    
    func getUnitConverter() -> NSDictionary? {
        
        let dict = LocalAdapter.instance.getJsonDict("Unit Converter", dir: .Bundle)
        
        return dict
    }
    
    func getProgramInstancePreviewList() -> NSArray? {
        
        let array = LocalAdapter.instance.getJsonArray("ProgramInstancePreview", dir: .Bundle)
        
        return array
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
    
    func getMyGPA() -> Double? {
        
        let dict = LocalAdapter.instance.getPlist("User", dir: .Document)
        if (dict == nil) {
            return nil
        }
        
        let gpa = dict!.objectForKey("mygpa") as Double?
        
        return gpa
    }
    
    func setMyGPA(gpa: Double?) -> Bool {
        
        if (gpa == nil) {
            return false
        }
        
        return LocalAdapter.instance.writePlist("User", key: "mygpa", value: gpa!)
    }
    
    func getBool(key: String) -> Bool? {
        
        let dict = LocalAdapter.instance.getPlist("User", dir: .Document)
        if (dict == nil) {
            return nil
        }
        
        let b = dict!.objectForKey(key) as Bool?
        
        return b
        
    }
    
    func setBool(key: String, value: Bool) -> Bool {
        
        return LocalAdapter.instance.writePlist("User", key: key, value: value)
    }
    
}