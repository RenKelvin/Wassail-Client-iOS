//
//  TipsCalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/14/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class TipsCalculatorViewController: UIViewController {
    
    @IBOutlet var selectorScollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.selectorScollView!.contentSize = CGSize(width: 600.0, height: 54)
        self.selectorScollView!.contentInset = UIEdgeInsets(top: 0.0, left: 100.0, bottom: 0.0, right: 0.0)
        
        self.generateLabels()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateLabels() {
        
        var cur: Double = 0.0
        for i in 0...100 {
            var label = UILabel()
            
            label.font = UIFont.boldSystemFontOfSize(32.0)
            label.textAlignment = NSTextAlignment.Center
            label.textColor = UIColor.whiteColor()
            label.text = String(i)
            
            label.frame = CGRect(origin: CGPoint(x: cur, y: 8), size: CGSize(width: 38.0, height: 38))
            cur += 38.0
            
            selectorScollView!.addSubview(label)
        }
    }
    
    @IBAction func f() {
        self.selectorScollView!.setContentOffset(CGPoint(x: 240.0, y: 0), animated: true)
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
