//
//  DefaultMapper.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultMapperSharedInstance = DefaultMapper()

class DefaultMapper: NSObject {
    
    class var instance : DefaultMapper {
    return _DefaultMapperSharedInstance
    }
    
    func getItem(name: NSString) -> NSDictionary? {
        var local = LocalAdapter.instance.getJson(name, dir: .Bundle)
        
        return RKInfoSyncSystem.instance.apply(nil, db: nil, local: local) as NSDictionary?
    }


}