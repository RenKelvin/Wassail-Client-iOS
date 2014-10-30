//
//  DatabaseAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _DatabaseAdapterSharedInstance = DatabaseAdapter()

class DatabaseAdapter: NSObject {
    
    class var instance : DatabaseAdapter {
        return _DatabaseAdapterSharedInstance
    }
    
    func create(entityName: NSString, context: NSManagedObjectContext) -> NSManagedObject? {
        
        let object = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as? NSManagedObject
        
        return object
    }
    
    func delete(item: NSManagedObject, context: NSManagedObjectContext) {
        
        context.deleteObject(item)
    }

    func fetch(entityName: NSString, context: NSManagedObjectContext, predicate: NSPredicate?, sortDescriptors: NSArray?) -> NSArray? {
        
        let entityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)
        
        var request = NSFetchRequest(entityName: entityName)
        
        request.entity = entityDescription
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        
        let array = context.executeFetchRequest(request, error: nil)
        
        return array
    }
    
    func saveContexts() {
        StaticDataManager.instance.saveContext()
        UserDataManager.instance.saveContext()
    }
    
}
