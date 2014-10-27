//
//  DBAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DBAdapterSharedInstance = DBAdapter()

class DBAdapter: NSObject {
    
    class var instance : DBAdapter {
        return _DBAdapterSharedInstance
    }
    
}
