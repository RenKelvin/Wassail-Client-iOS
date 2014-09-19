//
//  TipsCalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/14/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class TipsCalculatorViewController: UIViewController {
    
    var amount: Double = 0.0
    @IBOutlet var amountTextField: UITextField?
    
    var rate: Double = 15.0
    @IBOutlet var scrollerView: RKScrollerView?
    @IBOutlet var rateLabel: UILabel?

    var tips: Double = 0.0
    @IBOutlet var tipsTextField: UITextField?
    @IBOutlet var tipsLabel: UILabel?
    
    var total: Double = 0.0
    @IBOutlet var totalTextField: UITextField?
    @IBOutlet var totalLabel: UILabel?
    
    var num: Int = 1
    @IBOutlet var numTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollerView!.configure()
        
        self.amountTextField!.becomeFirstResponder()
        
        self.updateViews()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    func updateViews() {
        amountTextField!.text = String(format: "%.2f", amount)
        
        scrollerView!.scrollTo(rate)
        rateLabel!.text = String(format: "%f", scrollerView!.getRate())
        
        tipsTextField!.text = String(format: "%.2f", tips)
        totalTextField!.text = String(format: "%.2f", total)
        
        if (num == 1) {
            tipsLabel!.text = "小费"
            totalLabel!.text = "总价"
        }
        else {
            tipsLabel!.text = "人均小费"
            totalLabel!.text = "人均总价"
        }
        
        numTextField!.text = String(format: "%i", num)
        
    }
    
    func updateNumbersByAmount() {
        
        tips = amount * rate / 100.0 / Double(num)
        total = amount + tips / Double(num)
        
        self.updateViews()
    }
    
    func updateNumbersByNum() {
        
        tips = amount * rate / 100.0 / Double(num)
        total = (amount + tips) / Double(num)
        
        self.updateViews()
    }
    
    func updateNumbersByRate() {
        
        tips = amount * rate / 100.0 / Double(num)
        total = (amount + tips) / Double(num)
        
        self.updateViews()
    }
    
    
    // MARK: -
    
    @IBAction func f() {
        self.scrollerView!.setContentOffset(CGPoint(x: -200.0, y: 0), animated: true)
    }
    
    @IBAction func decRate() {
        let d = Double(rand() % 10) + 1
        self.scrollerView!.scrollTo(rate - d)
        rate -= d
        
        self.updateNumbersByRate()
    }
    
    @IBAction func incRate() {
        let d = Double(rand() % 10) + 1
        self.scrollerView!.scrollTo(rate + d)
        rate += d
        
        self.updateNumbersByRate()
    }
    
    @IBAction func decNum() {
        let n = NSString(string: numTextField!.text).integerValue
        
        if (n == 1) {
            return
        }
        
        num -= 1
        
        self.updateNumbersByNum()
    }
    
    @IBAction func incNum() {
        let n = NSString(string: numTextField!.text).integerValue
        
        if (n == 99) {
            return
        }
        
        num += 1
        
        self.updateNumbersByNum()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        amount = NSString(string: textField.text).doubleValue
        
        self.updateNumbersByAmount()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
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
