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
    
    @IBOutlet var backgroundImageView: UIImageView?
    
    @IBOutlet var defaultMessageLabel: UILabel?
    
    func clear() {
        for label in labels {
            label.removeFromSuperview()
        }
        labels.removeAllObjects()
        
        defaultMessageLabel!.hidden = true
    }
    
    func showDefaultMessage() {
        self.clear()
        
        defaultMessageLabel!.hidden = false
    }
    
    func generateLabels(num: Int, highlight: Bool) {
        
        self.clear()
        
        if (highlight) {
            backgroundImageView!.highlighted = true
        }
        else {
            backgroundImageView!.highlighted = false
        }
        
        let cellWidth = Double(self.frame.size.width)
        let labelWidth = (cellWidth - 30.0) / Double(num)
        
        var cur: Double = 15.0
        
        for i in 1...num {
            var label = UILabel()
            label.tag = 1
            
            label.textAlignment = NSTextAlignment.Center
            if (highlight) {
                label.textColor = UIColor.whiteColor()
                label.font = UIFont.boldSystemFontOfSize(14.0)
            }
            else {
                label.textColor = UIColor.HLTextGray()
                label.font = UIFont(name: "Helvetica Neue", size: 12.0)
            }
            
            label.frame = CGRect(origin: CGPoint(x: cur, y: 15), size: CGSize(width: labelWidth, height: 14.5))
            cur += labelWidth
            
            labels.addObject(label)
            self.addSubview(label)
        }
    }
    
    func configure(texts: NSArray?, highlight: Bool) {
        
        if (texts == nil) {
            return
        }
        
        self.generateLabels(texts!.count, highlight: highlight)
        
        for i in 1...texts!.count {
            var label = labels.objectAtIndex(i-1) as UILabel
            label.text = texts!.objectAtIndex(i-1) as NSString
        }
    }
    
}
