//
//  HLApply.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 11/1/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import Foundation
import CoreData

@objc(HLApply)
class HLApply: NSManagedObject {
    
    @NSManaged var programInstanceId: NSNumber
    @NSManaged var status: NSNumber
    @NSManaged var toeflDone: NSNumber
    @NSManaged var ieltsDone: NSNumber
    @NSManaged var greDone: NSNumber
    @NSManaged var satoractDone: NSNumber
    @NSManaged var apDone: NSNumber
    @NSManaged var psDone: NSNumber
    @NSManaged var cvDone: NSNumber
    @NSManaged var rlDone: NSNumber
    @NSManaged var wsDone: NSNumber
    @NSManaged var trDone: NSNumber
    @NSManaged var afDone: NSNumber
    
    func getDoneCount() -> Int {
        var count = 0
        
        if (toeflDone.boolValue) {count++}
        if (ieltsDone.boolValue) {count++}
        if (greDone.boolValue) {count++}
        if (satoractDone.boolValue) {count++}
        if (apDone.boolValue) {count++}
        if (psDone.boolValue) {count++}
        if (cvDone.boolValue) {count++}
        if (rlDone.boolValue) {count++}
        if (wsDone.boolValue) {count++}
        if (trDone.boolValue) {count++}
        if (afDone.boolValue) {count++}
        
        return count
    }
    
    func getDone(ind: Int) -> Bool {
        
        switch ind {
        case 101:
            return toeflDone.boolValue
        case 102:
            return ieltsDone.boolValue
        case 103:
            return greDone.boolValue
        case 104:
            return satoractDone.boolValue
        case 105:
            return apDone.boolValue
        case 201:
            return psDone.boolValue
        case 202:
            return cvDone.boolValue
        case 203:
            return rlDone.boolValue
        case 204:
            return wsDone.boolValue
        case 205:
            return trDone.boolValue
        case 301:
            return afDone.boolValue
        default:
            return false
        }
    }
    
    func setDone(ind: Int, done: Bool) {
        
        switch ind {
        case 101:
            toeflDone = NSNumber(bool: done)
        case 102:
            ieltsDone = NSNumber(bool: done)
        case 103:
            greDone = NSNumber(bool: done)
        case 104:
            satoractDone = NSNumber(bool: done)
        case 105:
            apDone = NSNumber(bool: done)
        case 201:
            psDone = NSNumber(bool: done)
        case 202:
            cvDone = NSNumber(bool: done)
        case 203:
            rlDone = NSNumber(bool: done)
        case 204:
            wsDone = NSNumber(bool: done)
        case 205:
            trDone = NSNumber(bool: done)
        case 301:
            afDone = NSNumber(bool: done)
        default:
            ""
        }
    }
    
}
