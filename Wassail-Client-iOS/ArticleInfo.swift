//
//  ArticleInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ArticleInfoSharedInstance = ArticleInfo()

class ArticleInfo: NSObject {
    
    class var instance : ArticleInfo {
    return _ArticleInfoSharedInstance
    }
    
    func getArticle(name: String) -> HLArticle? {
        return DefaultAccessor.instance.getItem(name+".md") as HLArticle?
    }
}