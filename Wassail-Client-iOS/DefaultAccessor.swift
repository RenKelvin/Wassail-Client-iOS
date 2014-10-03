//
//  DefaultAccessor.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultAccessorSharedInstance = DefaultAccessor()

class DefaultAccessor: NSObject {
    
    var imageCache: NSMutableDictionary = NSMutableDictionary()
    
    class var instance : DefaultAccessor {
    return _DefaultAccessorSharedInstance
    }
    
    func getItem(name: NSString) -> HLItem? {
        var raw = DefaultMapper.instance.getItem(name)
        
        if (raw == nil) {
            println("DefaultAccessor.getItem: \(name) - Failed!")
            return nil
        }
        
        return HLItemBuilder.build(raw!)
    }
    
    func getImage(name: NSString) -> UIImage? {
        
        // Cache image
        let img = self.imageCache.objectForKey(name) as UIImage?
        if (img != nil) {
            return img
        }
        
        let image = LocalMediator.instance.getImage(name) as UIImage?
        // FIXME: If no image for name, update it
        if (image != nil) {
            self.imageCache.setObject(image!, forKey: name)
        }
        
        return image
    }
    
    func getTools() -> NSDictionary? {
        return LocalMediator.instance.getTools()
    }
    
    func getSizeConverter() -> NSDictionary? {
        return LocalMediator.instance.getSizeConverter()
    }
    
    func getUnitConverter() -> NSDictionary? {
        return LocalMediator.instance.getUnitConverter()
    }
    
    func sendFeedback(text: NSString) {
        AWSMediator.instance.sendFeedback(text)
    }
    
}