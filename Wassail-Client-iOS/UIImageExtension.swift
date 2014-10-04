//
//  UIImageExtension.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/2/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

extension UIImage {
    
    func scaledToSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
