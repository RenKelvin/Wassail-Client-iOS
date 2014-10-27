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
            var object: HLProgramInstancePreview? = DatabaseAdapter.instance.createObject("HLProgramInstancePreview", contextType: .Static) as? HLProgramInstancePreview
            
            object!.configure(dict as NSDictionary)
        }
    }
    
    func saveContexts() {
        DatabaseAdapter.instance.saveContexts()
    }
}
