//
//  HLArticle.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLArticle: HLItem {
    
    var title: NSString?
    var author: NSString?
    var date: NSString?
    var header: NSString?
    
    var footer: NSString?
    
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
    }
    
    func numberOfGroups() -> Int {
        return groups.count
    }
    
    func numberOfItemsInChapter(chapter: Int) -> Int {
        let groupDict = groups[chapter] as NSDictionary
        let itemsArray = groupDict.objectForKey("items") as NSArray
        
        return itemsArray.count
    }
    
    func titleForChapter(chapter: Int) -> NSString {
        let chapterDict = groups[chapter] as NSDictionary
        let title = chapterDict.objectForKey("title") as NSString
        
        return title
    }
    
    func item(chapter: Int, row: Int) -> NSDictionary {
        let chapter = groups.objectAtIndex(chapter) as NSDictionary
        let items = chapter.objectForKey("items") as NSArray
        
        return items.objectAtIndex(row) as NSDictionary
    }
    
    func imagesArray() -> NSArray {
        var container = NSMutableArray()
        
        let m = groups.count
        for i in 1...groups.count {
            let group = groups[i-1] as NSDictionary
            let items = group.objectForKey("items") as NSArray
            for j in 1...items.count {
                let item = items[j-1] as NSDictionary
                let kind = item.objectForKey("kind") as NSString
                if (kind == "Item") {
                    let content = item.objectForKey("content") as NSDictionary
                    let type = content.objectForKey("type") as NSString
                    if (type == "HLImg" || type == "HLImage") {
                        let body = content.objectForKey("body") as NSDictionary
                        let address = body.objectForKey("address") as NSString
                        
                        let url = DefaultAccessor.instance.getImageURL(address)
                        if (url != nil) {
                        container.addObject(url!)
}
                        else {
                            println(address)
                        }
                    }
                }
            }
        }
        
        return container
    }
    
}
