//
//  RKPickerView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/16/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKPickerView: UIView {
    
    @IBOutlet var picker: UIView?
    
    var buttons: NSMutableArray = []
    
    func generateButtons(num: Int) {
        
        for button in buttons {
            button.removeFromSuperview()
        }
        buttons.removeAllObjects()
        
        if (num == 0) {
            return
        }
        
        let viewWidth = Double(self.frame.size.width)
        let viewHeight = Double(self.frame.size.height)
        let buttonHeight = viewHeight / Double(num)
        
        var cur: Double = 0.0
        
        for i in 0...(num-1) {
            var button = UIButton()
            var label = button.titleLabel
            
            label!.font = UIFont.boldSystemFontOfSize(14.0)
            label!.textAlignment = NSTextAlignment.Center
            label!.textColor = UIColor.whiteColor()
            
            button.frame = CGRect(origin: CGPoint(x: 0, y: cur), size: CGSize(width: viewWidth, height: buttonHeight))
            cur += buttonHeight
            
            buttons.addObject(button)
            self.addSubview(button)
        }
    }
    
    func reload(units: NSArray) {
        
        self.generateButtons(units.count)
        
        if (units.count == 0) {
            return
        }
        
        for i in 0...(units.count-1) {
            var button = buttons.objectAtIndex(i) as UIButton
            button.setTitle(units.objectAtIndex(i) as NSString, forState: UIControlState.Normal)
        }
        
        self.pick(4)
        
    }
    
    func pick(num: Int) {
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveEaseOut, animations: {
            
            println(self.picker!.center)
            let button = self.buttons.objectAtIndex(num) as UIButton
            println(CGPoint(x: button.center.x, y: button.center.y))
            self.picker!.center = (CGPoint: CGPoint(x: button.center.x, y: button.center.y))
            
            },
            completion: {
                finished in
                println("Napkins opened!")
            }
        )
        
    }
    
}
