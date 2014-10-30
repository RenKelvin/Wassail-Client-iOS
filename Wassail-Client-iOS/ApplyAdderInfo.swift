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
    
    var degree: Int = 2
    var field: Int = 0
    var year: Int = 2015
    var season: Int = 3
    
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
        
        let predicate = NSPredicate(format: "year == %d && season == %d && degreeType == %d", year, season, degree) // TODO: field
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
        data = filteredArray
    }
    
    func getAllPrograms() -> NSArray? {
        
        if (data == nil) {
            self.reloadData()
        }
        
        return data
    }
    
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
        
        let predicate = NSPredicate(format: "universityName CONTAINS[c] %@ || programName CONTAINS[c] %@ ", text ,text)
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
        self.searchText = text
        self.searchResultsArray = filteredArray
        
        return self.searchResultsArray
    }
}
