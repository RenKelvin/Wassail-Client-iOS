//
//  RKNumbersViewCell.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/17/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKNumbersViewCell: UITableViewCell {
    
    var labels: NSMutableArray = []
    
    func generateLabels(num: Int) {
        
        let cellWidth = Double(self.frame.size.width)
        let labelWidth = (cellWidth - 30.0) / Double(num)
        
        var cur: Double = 15.0
        
        for i in 1...num {
            var label = UILabel()
            
            label.font = UIFont(name: "Helvetica Neue", size: 12.0)
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.HLTextGray()
            
            label.frame = CGRect(origin: CGPoint(x: cur, y: 15), size: CGSize(width: labelWidth, height: 14.5))
            cur += labelWidth
            
            labels.addObject(label)
            self.addSubview(label)
        }
    }
    
    func configure(texts: NSArray) {
        if (labels.count == 0) {
            self.generateLabels(texts.count)
        }
        
        for i in 1...texts.count {
            var label = labels.objectAtIndex(i-1) as UILabel
            label.text = texts.objectAtIndex(i-1) as NSString
        }
    }
    
}
