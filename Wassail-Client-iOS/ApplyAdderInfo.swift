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
    
    var year: Int = 0
    var season: Int = 0
    var degree: Int = 0
    
    var field: Int = 0
    
    var searchText: NSString = ""
    var searchResultsArray: NSArray?
    
    class var instance : ApplyAdderInfo {
        return _ApplyAdderInfoSharedInstance
    }
    
    // MARK: -
    
    func updateHeader() {
        year = NSUserDefaults.standardUserDefaults().integerForKey("defaultYear")
        if (year == 0) {
            year = 2015
        }
        season = NSUserDefaults.standardUserDefaults().integerForKey("defaultSeason")
        if (season == 0) {
            season = 3
        }
        degree = NSUserDefaults.standardUserDefaults().integerForKey("defaultDegree")
        if (degree == 0) {
            degree = 2
        }
        field = NSUserDefaults.standardUserDefaults().integerForKey("defaultField")
        if (field == 0) {
            field = 204
        }
    }
    
    func reloadData() {
        
        self.updateHeader()
        
        let array = ApplyAccessor.instance.getProgramInstancePreviewList()
        
        if (array == nil) {
            return
        }
        
        let predicate = NSPredicate(format: "year == %d && season == %d && degreeType == %d", year, season, degree)
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
        data = filteredArray
    }
    
    func getAllPrograms() -> NSArray? {
        
        if (data == nil) {
            self.reloadData()
        }
        
        if (degree == 1) {
            return data
        }
        
        let predicate = NSPredicate(format: "field == %d", field)
        let filteredArray = data!.filteredArrayUsingPredicate(predicate!)
        
        return filteredArray
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
        
        let predicate = NSPredicate(format: "universityName CONTAINS[c] %@ || programName CONTAINS[c] %@", text ,text)
        let filteredArray = array!.filteredArrayUsingPredicate(predicate!)
        
        self.searchText = text
        self.searchResultsArray = filteredArray
        
        return self.searchResultsArray
    }
}
