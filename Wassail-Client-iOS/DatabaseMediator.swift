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

    func generateProgramInstanceRequirementsList() {
        
        // Get json array
        let array = LocalMediator.instance.getProgramInstanceRequirementsList() as NSArray?
        if (array == nil) {
            return
        }
        
        // Insert each object
        for dict in array! {
            var object: HLProgramInstanceRequirements? = DatabaseAdapter.instance.create("HLProgramInstanceRequirements", context: StaticDataManager.instance.managedObjectContext!) as? HLProgramInstanceRequirements
            
            object!.configure(dict as NSDictionary)
        }
    }
    
    func getProgramInstancePreviewList() -> NSArray? {
        
        var sortDescriptors: NSMutableArray = NSMutableArray()
        let sortDescriptor1 = NSSortDescriptor(key: "universityName", ascending: true)
        sortDescriptors.addObject(sortDescriptor1)
        let sortDescriptor2 = NSSortDescriptor(key: "programName", ascending: true)
        sortDescriptors.addObject(sortDescriptor2)
        
        return DatabaseAdapter.instance.fetch("HLProgramInstancePreview", context: StaticDataManager.instance.managedObjectContext!, predicate: nil, sortDescriptors: sortDescriptors)
    }
    
    func getApplyList() -> NSArray? {
        
        var sortDescriptors: NSMutableArray = NSMutableArray()
        let sortDescriptor = NSSortDescriptor(key: "status", ascending: true)
        sortDescriptors.addObject(sortDescriptor)
        
        return DatabaseAdapter.instance.fetch("HLApply", context: UserDataManager.instance.managedObjectContext!, predicate: nil, sortDescriptors: sortDescriptors)
    }
    
    func createApply(item: HLProgramInstancePreview) -> HLApply? {
        
        return DatabaseAdapter.instance.create("HLApply", context: UserDataManager.instance.managedObjectContext!) as? HLApply
    }
    
    func deleteApply(item: HLApply) {
        
        return DatabaseAdapter.instance.delete(item, context: UserDataManager.instance.managedObjectContext!)
    }
    
    func getProgramInstancePreviewByProgramInstanceId(id: NSNumber) -> HLProgramInstancePreview? {
        
        let predicate = NSPredicate(format: "programInstanceId = %@", id)
        
        let array = DatabaseAdapter.instance.fetch("HLProgramInstancePreview", context: StaticDataManager.instance.managedObjectContext!, predicate: predicate, sortDescriptors: nil)
        
        if (array == nil || array!.count == 0) {
            return nil
        }
        
        return array![0] as? HLProgramInstancePreview
    }
    
    func getProgramInstanceRequirementsByProgramInstanceId(id: NSNumber) -> HLProgramInstanceRequirements? {
        
        let predicate = NSPredicate(format: "programInstanceId = %@", id)
        
        let array = DatabaseAdapter.instance.fetch("HLProgramInstanceRequirements", context: StaticDataManager.instance.managedObjectContext!, predicate: predicate, sortDescriptors: nil)
        
        if (array == nil || array!.count == 0) {
            return nil
        }
        
        return array![0] as? HLProgramInstanceRequirements
    }
    
    func getApplyByProgramInstanceId(id: NSNumber) -> HLApply? {
        let predicate = NSPredicate(format: "programInstanceId = %@", id)
        
        let array = DatabaseAdapter.instance.fetch("HLApply", context: UserDataManager.instance.managedObjectContext!, predicate: predicate, sortDescriptors: nil) as NSArray?
        
        if (array == nil || array!.count == 0) {
            return nil
        }
        
        return array![0] as? HLApply
    }
    
}
