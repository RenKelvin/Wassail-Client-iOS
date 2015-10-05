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
        
        let df: NSDateFormatter = NSDateFormatter()
        df.timeZone = NSTimeZone.defaultTimeZone()
        df.dateFormat = "yyyy-MM-dd"
        
        return df.dateFromString(string as String)
    }
    
     func normalString() -> NSString? {
        
        let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let components = calendar!.components([.Year, .Month, .Day], fromDate: self)
        
        let year = components.year as Int
        let month = components.month as Int
        let day = components.day as Int
        
        return NSString(format: "\(year)-\(month)-\(day)")
    }

}
