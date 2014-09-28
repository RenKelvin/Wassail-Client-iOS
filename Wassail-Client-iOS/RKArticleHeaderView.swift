//
//  RKArticleHeaderView.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/28/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class RKArticleHeaderView: UIView {
    
    @IBOutlet var titleLabel: UILabel?
    
    @IBOutlet var leaderView: UIView?
    
    func setTitle(title: String) {
        titleLabel?.text = title
    }
    
    func setLeaderColor(index: Int) {
        let index = index % 5
        
        switch index {
        case 0:
            leaderView!.backgroundColor! = UIColor.HLYellow(0)
        case 1:
            leaderView!.backgroundColor! = UIColor.HLOrange(0)
        case 2:
            leaderView!.backgroundColor! = UIColor.HLGreen(0)
        case 3:
            leaderView!.backgroundColor! = UIColor.HLRed(0)
        case 4:
            leaderView!.backgroundColor! = UIColor.HLBlue(0)
        default:
            leaderView!.backgroundColor! = UIColor.HLYellow(0)
        }
    }
    
}
