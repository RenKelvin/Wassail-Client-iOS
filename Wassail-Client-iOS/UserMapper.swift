//
//  UserMapper.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/20/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _UserMapperSharedInstance = UserMapper()

class UserMapper: NSObject {
    
    class var instance : UserMapper {
    return _UserMapperSharedInstance
    }
    
    func getMySize() -> NSDictionary? {
        var local = LocalAdapter.instance.getPlist("User", dir: .Document)
        
        return RKInfoSyncSystem.instance.apply(nil, db: nil, local: local) as NSDictionary?
    }
}