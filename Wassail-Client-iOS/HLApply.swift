//
//  HLApply.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation
import CoreData

@objc(HLApply)
class HLApply: NSManagedObject {

    @NSManaged var status: NSNumber
    @NSManaged var programInstanceId: NSNumber
    @NSManaged var preview: HLProgramInstancePreview
    @NSManaged var requirements: NSManagedObject

}
