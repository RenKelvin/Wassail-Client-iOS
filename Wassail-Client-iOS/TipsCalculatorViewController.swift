//
//  TipsCalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/14/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class TipsCalculatorViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    var amount: Double = 64.0
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
    
    var scrollTag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        self.amountTextField!.becomeFirstResponder()
        
        scrollerView!.configure()
        self.updateViews()
        scrollerView!.scrollTo(rate)
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
    
    func getRateString() -> NSString{
        if (rate == 15) {
            return String(format: "推荐小费 %.0f%%", rate)
        }
        else {
            return String(format: "%.0f%%", rate)
        }
    }
    
    func updateViews() {
        amountTextField!.text = String(format: "%.2f", amount)
        
        rateLabel!.text = self.getRateString()
        
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
        scrollTag = false
        
        let d = Double(rand() % 10) + 1
        rate -= d
        
        self.updateNumbersByRate()
        
        scrollerView!.scrollTo(rate)
    }
    
    @IBAction func incRate() {
        scrollTag = false
        
        let d = Double(rand() % 10) + 1
        rate += d
        
        self.updateNumbersByRate()
        
        scrollerView!.scrollTo(rate)
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
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if (scrollTag == false) {
            return
        }
        
        rate = (scrollView as RKScrollerView).getRate()
        
        self.updateNumbersByRate()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        scrollTag = true
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
