//
//  TipsCalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/14/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class TipsCalculatorViewController: UIViewController {
    
    @IBOutlet var scrollerView: RKScrollerView?
    
    var currentRate: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollerView!.configure()
        self.scrollerView!.scrollTo(Int(currentRate))

    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func f() {
        self.scrollerView!.setContentOffset(CGPoint(x: -200.0, y: 0), animated: true)
    }
    
    @IBAction func decRate() {
        let d = Double(rand() % 10) + 1
        self.scrollerView!.scrollTo(Int(currentRate - d))
        currentRate += d
    }
    
    @IBAction func incRate() {
        let d = Double(rand() % 10) + 1
        self.scrollerView!.scrollTo(Int(currentRate + d))
        currentRate += d
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
