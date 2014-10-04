//
//  HLList.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLList: HLItem {
    
    var title: NSString?
    
    var author: NSString?
    var date: NSString?
    var header: NSString?
    
    var groups: NSArray = []
    
    override init() {
        super.init()
    }
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Body
        let jsonBody = json.objectForKey("body") as NSDictionary
        
        title = jsonBody.objectForKey("title") as NSString?
        author = jsonBody.objectForKey("author") as NSString?
        date = jsonBody.objectForKey("date") as NSString?
        header = jsonBody.objectForKey("header") as NSString?
        
        groups = jsonBody.objectForKey("groups") as NSArray
        
        // Groups
        for group in groups {
            var items = group.objectForKey("items") as NSMutableArray
            for item in items {
                
                let kind = (item as NSDictionary).objectForKey("kind") as NSString
                
                // HLItem
                if (kind == "Item") {
                    let content = (item as NSDictionary).objectForKey("content") as NSMutableDictionary
                    let body = content.objectForKey("body") as NSMutableDictionary
                    
                    // Add attributes
                    let keys = (item as NSDictionary).allKeys
                    for key in keys {
                        if (key as NSString != "kind" && key as NSString != "content") {
                            let object: AnyObject! = (item as NSDictionary).objectForKey((key as NSString)) as AnyObject!
                            body.setObject(object, forKey: (key as NSString))
                        }
                    }
                    
                    content.setObject(body, forKey: "body")
                    
                    let model = HLItemBuilder.build(content as NSDictionary)
                    items.replaceObjectAtIndex(items.indexOfObject(item), withObject: model)
                }
                
                // NOHLItem
                else {
                    let model: Item = Item(json: item as NSDictionary)
                    items.replaceObjectAtIndex(items.indexOfObject(item), withObject: model)
                }
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
    
    func item(group: Int, row: Int) -> Item {
        let group = groups.objectAtIndex(group) as NSDictionary
        let items = group.objectForKey("items") as NSArray
        
        return items.objectAtIndex(row) as Item
    }
}