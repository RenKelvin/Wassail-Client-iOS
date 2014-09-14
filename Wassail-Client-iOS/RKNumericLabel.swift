//
//  RKNumericLabel.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKNumericLabel: UILabel {
    
    let duration: Double = 2.0
    let frames: Int = 60
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    
    func setNumber(number: Double) {
        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("setNumberHandler"), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func setNumberHandler(from: Double, to: Double, timer: NSTimer, times: Int) {
        //        println("123")
        //        if times == frames {
        //            timer.invalidate()
        //            return
        //        }
        //
        //        self.text = String(times)
    }
    
}
