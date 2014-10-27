//
//  HLProgramInstancePreview.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/27/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation
import CoreData

class HLProgramInstancePreview: NSManagedObject {

    @NSManaged var deadlineDate: NSDate
    @NSManaged var degreeType: NSNumber
    @NSManaged var programId: NSNumber
    @NSManaged var programName: String
    @NSManaged var season: NSNumber
    @NSManaged var universityName: String
    @NSManaged var year: NSNumber
    @NSManaged var apply: NSManagedObject

}
