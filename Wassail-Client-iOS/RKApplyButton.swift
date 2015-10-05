//
//  RKApplyButton.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKApplyButton: UIButton {
    
    @IBOutlet var textLabel: UILabel?

    var stat: Int = 0
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    func setStatus(status: Int) {

        self.stat = status
        
        var title = ""
        var color = UIColor.clearColor()
        
        switch status {
        case 0:
            title = "开始申请"
            color = UIColor.HLBlue(0)
        case 1:
            title = "正在申请"
            color = UIColor.HLYellow(0)
        case 2:
            title = "申请完成"
            color = UIColor.HLOrange(0)
        case 3:
            title = "已录取"
            color = UIColor.HLGreen(0)
        case 4:
            title = "已拒绝"
            color = UIColor.HLRed(0)
        default:
            ""
        }
        
        textLabel!.text = title
        textLabel!.textColor = color
    }
    
}
