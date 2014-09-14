//
//  ListInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ListInfoSharedInstance = ListInfo()

class ListInfo: NSObject {
    
    class var instance : ListInfo {
    return _ListInfoSharedInstance
    }
    
    func getList(name: String) -> HLList? {
        return DefaultAccessor.instance.getItem(name) as HLList?
    }
}