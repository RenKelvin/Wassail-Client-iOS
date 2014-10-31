//
//  HLProgramInstancePreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/27/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation
import CoreData

@objc(HLProgramInstancePreview)
class HLProgramInstancePreview: NSManagedObject {
    
    @NSManaged var programInstanceId: NSNumber
    @NSManaged var deadlineDate: NSDate
    @NSManaged var degreeType: NSNumber
    @NSManaged var iconAddress: String
    @NSManaged var programName: String
    @NSManaged var season: NSNumber
    @NSManaged var universityName: String
    @NSManaged var year: NSNumber
    @NSManaged var apply: NSManagedObject
    
    func configure(dict: NSDictionary) {
        let json: JSON = JSON(dict) as JSON
        
        programInstanceId = json["programInstanceId"].intValue

        let date = NSDate.dateWithString(json["DeadlineDate"].stringValue)
        if (date != nil) {
            deadlineDate = date!
        }
        degreeType = json["DegreeType"].intValue
        iconAddress = json["IconUrl"].stringValue
        programName = json["programName"].stringValue
        season = json["Season"].intValue
        universityName = json["universityName"].stringValue
        year = json["Year"].intValue
    }
    
}
