//
//  UniversityAccessor.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/1/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _UniversityAccessorSharedInstance = UniversityAccessor()

class UniversityAccessor: NSObject {
    
    class var instance : UniversityAccessor {
        return _UniversityAccessorSharedInstance
    }
    
    func getProgramInstancePreviewByProgramInstanceId(id: NSNumber) -> HLProgramInstancePreview? {
        return DatabaseMediator.instance.getProgramInstancePreviewByProgramInstanceId(id)
    }
    
    func getProgramInstanceRequirementsByProgramInstanceId(id: NSNumber) -> HLProgramInstanceRequirements? {
        return DatabaseMediator.instance.getProgramInstanceRequirementsByProgramInstanceId(id)
    }
    
    func getUniversityRanking(name: NSString, callback: (success: Bool, list: HLList?) -> Void) {
        CloudMediator.instance.getUniversityRanking(name, callback)
    }

    func getProgramInstanceInfo(id: NSNumber, callback: (success: Bool, data: NSDictionary?) -> Void) {
        CloudMediator.instance.getProgramInstanceInfo(id, callback)
    }
    
}
