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
    
    func getList() -> HLList {
        return HLList(json: NSDictionary.dictionary())
    }
    
}