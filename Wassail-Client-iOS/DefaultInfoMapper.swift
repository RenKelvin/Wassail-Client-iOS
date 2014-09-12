//
//  DefaultInfoMapper.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DefaultInfoMapperSharedInstance = DefaultInfoMapper()

class DefaultInfoMapper: NSObject {
    
    class var instance : DefaultInfoMapper {
    return _DefaultInfoMapperSharedInstance
    }
    
    func getList(name: String) -> NSDictionary {
        var local = LocalAdapter.instance.get(name, type: "json")
        
        return RKInfoSysnSystem.instance.apply(nil, db: nil, local: local) as NSDictionary
    }
    
    func getTools() -> NSDictionary {
        var local = LocalAdapter.instance.get("Tools", type: "json")
        
        return RKInfoSysnSystem.instance.apply(nil, db: nil, local: local) as NSDictionary
    }
    
}