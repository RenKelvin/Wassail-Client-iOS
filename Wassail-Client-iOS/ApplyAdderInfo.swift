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
    
    var degree: Int = 1
    var field: Int = 0
    
    var searchText: NSString = ""
    var searchResultsArray: NSArray?
    
    class var instance : ApplyAdderInfo {
        return _ApplyAdderInfoSharedInstance
    }
    
    // MARK: -
    
    func reloadData() {
        let array = ApplyAccessor.instance.getProgramInstancePreviewList()
        
        if (array == nil) {
            return
        }
       
        

       let predicate = NSPredicate(format: "degreeType == %d", degree) // TODO: field
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
        data = filteredArray
    }
    
    func getAllPrograms() -> NSArray? {
        
        if (data == nil) {
            self.reloadData()
        }
        
        return data
    }
    
    // TODO: need optimization
    func getFilteredPrograms(text: NSString) -> NSArray? {
        
        if (data == nil) {
            self.reloadData()
        }
        
        // Same
        if (self.searchText == text) {
            return searchResultsArray
        }
        
        let array = self.getAllPrograms()
        if (array == nil) {
            return nil
        }
        
        let predicate = NSPredicate(format: "universityName CONTAINS[c] %@", text)
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
        self.searchText = text
        self.searchResultsArray = filteredArray
        
        return self.searchResultsArray
    }
}
