//
//  LocalAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class LocalAdapter: NSObject {
    
    func getList() -> HLList {
        //
        let path = NSBundle.mainBundle().pathForResource("University Rankings 1.0", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
        
        //
        return HLList(json: json)
    }
    
}
