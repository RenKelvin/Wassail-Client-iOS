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

        let object = NSEntityDescription.insertNewObjectForEntityForName(entityName as String, inManagedObjectContext: context) as NSManagedObject

        return object
    }

    func delete(item: NSManagedObject, context: NSManagedObjectContext) {

        context.deleteObject(item)
    }

    func fetch(entityName: NSString, context: NSManagedObjectContext, predicate: NSPredicate?, sortDescriptors: NSArray?) -> NSArray? {

        let entityDescription = NSEntityDescription.entityForName(entityName as String, inManagedObjectContext: context)

        let request = NSFetchRequest(entityName: entityName as String)

        request.entity = entityDescription
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors as? [NSSortDescriptor]

        let array = try? context.executeFetchRequest(request)

        return array
    }

    func saveContexts() {
        StaticDataManager.instance.saveContext()
        UserDataManager.instance.saveContext()
    }
    
}
