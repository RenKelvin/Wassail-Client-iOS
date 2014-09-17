//
//  RKNumbersView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/17/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKNumbersView: UITableView {

    @IBOutlet var headerView: UIView?
    
    var labels: NSMutableArray = []

    func generateLabels(num: Int) {
        
        let cellWidth = Double(self.frame.size.width)
        let labelWidth = (cellWidth - 30.0) / Double(num)
        
        var cur: Double = 15.0
        
        for i in 1...num {
            var label = UILabel()
            
            label.font = UIFont.boldSystemFontOfSize(16.0)
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.HLTextBlack()
            
            label.frame = CGRect(origin: CGPoint(x: cur, y: 15), size: CGSize(width: labelWidth, height: 14.5))
            cur += labelWidth
            
            labels.addObject(label)
            headerView!.addSubview(label)
        }
    }
    
    func reload(header: NSArray) {
        if (labels.count == 0) {
            self.generateLabels(header.count)
        }
        
        for i in 1...header.count {
            var label = labels.objectAtIndex(i-1) as UILabel
            label.text = header.objectAtIndex(i-1) as NSString
        }
        
        self.reloadData()
    }
    
}
