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
    
    var delegate: RKPickerViewDelegate?
    
    func generateButtons(num: Int) {
        
        for button in buttons {
            button.removeFromSuperview()
        }
        buttons.removeAllObjects()
        
        if (num == 0) {
            return
        }
        
        let viewWidth = Double(self.frame.size.width) as Double
        let viewHeight = Double(self.frame.size.height) as Double
        let buttonHeight = viewHeight / Double(num) as Double
        
        var cur: Double = 0.0
        
        for i in 0...(num-1) {
            
            var button = NSBundle.mainBundle().loadNibNamed("RKPlayground", owner: nil, options: nil).first as UIButton
            
            buttons.addObject(button)
            
            button.frame = CGRect(origin: CGPoint(x: 0, y: cur), size: CGSize(width: viewWidth, height: buttonHeight))
            cur += buttonHeight
            
            button.tag = i
            button.addTarget(self, action: Selector("buttonSelector:"), forControlEvents: UIControlEvents.TouchUpInside)
            
            self.addSubview(button)
        }
    }
    
    func buttonSelector(sender: UIButton!) {
        pickerMove(sender.tag)
        
        delegate?.pickerView(pickerView: self, didselectedAtIndex: sender.tag)
    }
    
    func generatePicker() {
        
        if (picker == nil) {
            if (buttons.count == 0) {
                return
            }
            
            picker = NSBundle.mainBundle().loadNibNamed("RKPlayground", owner: nil, options: nil).last as UIImageView
            
            let button = self.buttons.objectAtIndex(0) as UIButton
            picker!.center = (CGPoint: CGPoint(x: button.center.x, y: button.center.y))
            self.addSubview(picker!)
        }
        
        if (self.tag == 0) {
            self.pickerMove(0)
        }
        else {
            self.pickerMove(1)
        }
    }
    
    func reload(units: NSArray) {
        
        self.generateButtons(units.count)
        self.generatePicker()
        
        if (units.count == 0) {
            return
        }
        
        for i in 0...(units.count-1) {
            var button = buttons.objectAtIndex(i) as UIButton
            let unitCN = (units.objectAtIndex(i) as NSDictionary).objectForKey("cn") as NSString
            button.setTitle(unitCN, forState: UIControlState.Normal)
        }
        
    }
    
    func pickerMove(num: Int) {
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseOut, animations: {
            
            let button = self.buttons.objectAtIndex(num) as UIButton
            
            self.picker!.center = (CGPoint: CGPoint(x: button.center.x, y: button.center.y))
            
            },
            completion: {
                finished in
                let a = 1
            }
        )
        
    }
    
}
