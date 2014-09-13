//
//  HLList.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLList: HLItem {
    var name: NSString = ""
    
    var title: NSString = ""
    var source: NSArray = []
    
    init(json: NSDictionary) {
        // Header
        name = json.objectForKey("name") as NSString
        
        // Body
        let jsonBody = json.objectForKey("body") as NSDictionary
        title = jsonBody.objectForKey("title") as NSString
        source = jsonBody.objectForKey("source") as NSArray
    }
    
    func numberOfGroups() -> Int {
        return source.count
    }
    
    func numberOfItemsInGroup(group: Int) -> Int {
        let groupDict = source[group] as NSDictionary
        let itemsArray = groupDict.objectForKey("items") as NSArray
        
        return itemsArray.count
    }
    
    func titleForGroup(group: Int) -> NSString {
        let groupDict = source[group] as NSDictionary
        let title = groupDict.objectForKey("title") as NSString
        
        return title
    }
}