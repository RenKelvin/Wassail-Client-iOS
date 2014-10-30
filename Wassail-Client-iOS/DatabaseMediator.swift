//
//  DatabaseMediator.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DatabaseMediatorSharedInstance = DatabaseMediator()

class DatabaseMediator: NSObject {
    
    class var instance : DatabaseMediator {
        return _DatabaseMediatorSharedInstance
    }
    
    // MARK: -
    
    func generateProgramInstancePreviewList() {
        
        // Get json array
        let array = LocalMediator.instance.getProgramInstancePreviewList() as NSArray?
        if (array == nil) {
            return
        }
        
        // Insert each object
        for dict in array! {
            var object: HLProgramInstancePreview? = DatabaseAdapter.instance.create("HLProgramInstancePreview", context: StaticDataManager.instance.managedObjectContext!) as? HLProgramInstancePreview
            
            object!.configure(dict as NSDictionary)
        }
    }
    
    func getProgramInstancePreviewList() -> NSArray? {
        
        return DatabaseAdapter.instance.fetch("HLProgramInstancePreview", context: StaticDataManager.instance.managedObjectContext!, predicate: nil, sortDescriptors: nil)
    }
    
    func getApplyList() -> NSArray? {
        
        return DatabaseAdapter.instance.fetch("HLApply", context: UserDataManager.instance.managedObjectContext!, predicate: nil, sortDescriptors: nil)
    }
    
    func createApply(item: HLProgramInstancePreview) -> HLApply? {
        
        return DatabaseAdapter.instance.create("HLApply", context: UserDataManager.instance.managedObjectContext!) as? HLApply
    }
    
    func getProgramInstancePreviewByProgramInstanceId(id: NSNumber) -> HLProgramInstancePreview? {
        
        let predicate = NSPredicate(format: "programInstanceId = %@", id)
        
        let array = DatabaseAdapter.instance.fetch("HLProgramInstancePreview", context: StaticDataManager.instance.managedObjectContext!, predicate: nil, sortDescriptors: nil)
        
        return array![0] as HLProgramInstancePreview
    }
    
    func getApplyByProgramInstanceId(id: NSNumber) -> HLApply? {
        let predicate = NSPredicate(format: "programInstanceId = %@", id)
        
        let array = DatabaseAdapter.instance.fetch("HLApply", context: UserDataManager.instance.managedObjectContext!, predicate: predicate, sortDescriptors: nil) as NSArray?
        
        if (array == nil || array!.count == 0) {
            return nil
        }
        
        return array![0] as HLApply
    }
    
    
}
