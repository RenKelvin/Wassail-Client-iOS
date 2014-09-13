//
//  HLList.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLList: HLItem {
    
    var title: NSString = ""
    var groups: NSArray = []
    
    override init() {
        super.init()
    }
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Header
        name = json.objectForKey("name") as NSString
        
        // Body
        let jsonBody = json.objectForKey("body") as NSDictionary
        title = jsonBody.objectForKey("title") as NSString
        groups = jsonBody.objectForKey("groups") as NSArray
        
        // Groups
        for group in groups {
            var items = group.objectForKey("items") as NSMutableArray
            for item in items {
                let model = HLItemBuilder.build(item as NSDictionary)
                items.replaceObjectAtIndex(items.indexOfObject(item), withObject: model)
            }
        }
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
    
    func numberOfItemsInGroup(group: Int) -> Int {
        let groupDict = groups[group] as NSDictionary
        let itemsArray = groupDict.objectForKey("items") as NSArray
        
        return itemsArray.count
    }
    
    func titleForGroup(group: Int) -> NSString {
        let groupDict = groups[group] as NSDictionary
        let title = groupDict.objectForKey("title") as NSString
        
        return title
    }
    
    func item(group: Int, row: Int) -> HLItem {
        let group = groups.objectAtIndex(group) as NSDictionary
        let items = group.objectForKey("items") as NSArray
        
        return items.objectAtIndex(row) as HLItem
    }
}