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

}