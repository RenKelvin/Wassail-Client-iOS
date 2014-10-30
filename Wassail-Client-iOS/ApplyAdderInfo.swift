//
//  ApplyAdderInfo.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/26/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _ApplyAdderInfoSharedInstance = ApplyAdderInfo()

class ApplyAdderInfo: NSObject {
    
    var data: NSArray?
    
    var degree: Int = 0
    var field: Int = 0
    var text: NSString = ""
    var filteredArray: NSArray?
    
    class var instance : ApplyAdderInfo {
        return _ApplyAdderInfoSharedInstance
    }
    
    // MARK: -
    
    func reloadData() {
                data = ApplyAccessor.instance.getProgramInstancePreviewList()
}

    func getAllPrograms() -> NSArray? {
        if (data == nil) {
            self.reloadData()
        }
        
        return data
    }
    
    // TODO: need optimization
    func getFilteredPrograms(degree: Int, field: Int, text: NSString) -> NSArray? {
        
        // Same
        if (self.degree == degree && self.field == field && self.text == text) {
            return self.filteredArray
        }
        
        let array = self.getAllPrograms()

        if (array == nil) {
            return nil
        }

        let predicate = NSPredicate(format: "universityName CONTAINS[c] %@", text)
    
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
return filteredArray
    }
}
