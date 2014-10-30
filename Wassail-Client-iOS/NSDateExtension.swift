//
//  NSDateExtension.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

extension NSDate {
    
    class func dateWithString(string: NSString) -> NSDate? {
        
        var df: NSDateFormatter = NSDateFormatter()
        df.timeZone = NSTimeZone.defaultTimeZone()
        df.dateFormat = "yyyy-MM-dd"
        
        return df.dateFromString(string)
    }
    
     func normalString() -> NSString? {
        
        let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let components = calendar!.components(.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay, fromDate: self)
        
        let year = components.year as Int
        let month = components.month as Int
        let day = components.day as Int
        
        return NSString(format: "\(year)-\(month)-\(day)")
    }

}
