//
//  UIColorExtension.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func HLTextBlack() -> UIColor {
        return UIColor(red: 0.251, green: 0.251, blue: 0.251, alpha: 1.000)
    }
    
    class func HLTextGray() -> UIColor {
        return UIColor(red: 0.573, green: 0.573, blue: 0.573, alpha: 1.000)
    }
    
    class func HLBlue(level: Int) -> UIColor {
        switch level {
        case -2:
            return UIColor(red: 0.270, green: 0.663, blue: 1.000, alpha: 1.000)
        case -1:
            return UIColor(red: 0.270, green: 0.663, blue: 1.000, alpha: 1.000)
        case 0:
            return UIColor(red: 0.270, green: 0.663, blue: 1.000, alpha: 1.000)
        case 1:
            return UIColor(red: 0.270, green: 0.663, blue: 1.000, alpha: 1.000)
        case 2:
            return UIColor(red: 0.270, green: 0.663, blue: 1.000, alpha: 1.000)
        default:
            return UIColor(red: 0.270, green: 0.663, blue: 1.000, alpha: 1.000)
        }
    }
    
    class func HLRed(level: Int) -> UIColor {
        switch level {
        case -2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case -1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 0:
            return UIColor(red: 1.000, green: 0.349, blue: 0.051, alpha: 1.000)
        case 1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        default:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        }
    }
    
    class func HLOrange(level: Int) -> UIColor {
        switch level {
        case -2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case -1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 0:
            return UIColor(red: 1.000, green: 0.600, blue: 0.153, alpha: 1.000)
        case 1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        default:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        }
    }
    
    class func HLYellow(level: Int) -> UIColor {
        switch level {
        case -2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case -1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 0:
            return UIColor(red: 1.000, green: 0.808, blue: 0.000, alpha: 1.000)
        case 1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        default:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        }
    }
    
    class func HLGreen(level: Int) -> UIColor {
        switch level {
        case -2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case -1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 0:
            return UIColor(red: 0.600, green: 0.800, blue: 0.000, alpha: 1.000)
        case 1:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        case 2:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        default:
            return UIColor(red: 0.27, green: 0.66, blue: 1.0, alpha: 1.0)
        }
    }
    
    func makeTranslucent() -> UIColor {
        
        let rgb = CGColorGetComponents(self.CGColor) as UnsafePointer<CGFloat>
        
        let c = {n in ((n-40.0) / (1-(40.0/255.0)))}
        let r = c(Double(rgb[0])*255)
        let g = c(Double(rgb[1])*255)
        let b = c(Double(rgb[2])*255)
        
        return UIColor(red: CGFloat(r / 255), green: CGFloat(g / 255), blue: CGFloat(b / 255), alpha: 1.0)
    }
    
}
