//
//  ApplyAdderViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class ApplyAdderViewController: GAITrackedViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "Apply Adder Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        // navigationView!.backgroundColor! = UIColor.HLBlue(0)
    }
    
}
