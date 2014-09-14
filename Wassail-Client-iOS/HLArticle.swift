//
//  HLArticle.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/13/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class HLArticle: HLItem {
    
    var title: NSString = ""
    var chapters: NSArray = []
    
    override init() {
        super.init()
    }
    
    override init(json: NSDictionary) {
        super.init(json: json)
        
        // Body
        let jsonBody = json.objectForKey("body") as NSDictionary
        title = jsonBody.objectForKey("title") as NSString
        chapters = jsonBody.objectForKey("chapters") as NSArray
        
        //        // Chapters
        //        for chapter in chapters {
        //            var sections = chapter.objectForKey("sections") as NSMutableArray
        //            for section in sections {
        //                let model = HLItemBuilder.build(section as NSDictionary)
        //                sections.replaceObjectAtIndex(sections.indexOfObject(section), withObject: model)
        //            }
        //        }
    }
    
    func numberOfChapters() -> Int {
        return chapters.count
    }
    
    func numberOfGraphsInChapter(chapter: Int) -> Int {
        let chapterDict = chapters[chapter] as NSDictionary
        let graphsArray = chapterDict.objectForKey("graphs") as NSArray
        
        return graphsArray.count
    }
    
    func titleForChapter(chapter: Int) -> NSString {
        let chapterDict = chapters[chapter] as NSDictionary
        let title = chapterDict.objectForKey("title") as NSString
        
        return title
    }
 
    func item(chapter: Int, row: Int) -> NSDictionary {
        let chapter = chapters.objectAtIndex(chapter) as NSDictionary
        let items = chapter.objectForKey("graphs") as NSArray
        
        return items.objectAtIndex(row) as NSDictionary
    }

}
