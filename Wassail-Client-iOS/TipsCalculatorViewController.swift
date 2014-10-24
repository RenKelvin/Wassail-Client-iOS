//
//  TipsCalculatorViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/14/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class TipsCalculatorViewController: GAITrackedViewController, UIScrollViewDelegate, UITextFieldDelegate {
    
    var amount: Double = 50
    @IBOutlet var amountTextField: UITextField?
    @IBOutlet var keyboardAccessoryView: UIView?
    
    var rate: Double = 0.15
    @IBOutlet var scrollerView: RKScrollerView?
    @IBOutlet var rateLabel: UILabel?
    
    var tips: Double = 0.0
    @IBOutlet var tipsTextField: UITextField?
    @IBOutlet var tipsLabel: UILabel?
    @IBOutlet var tipsRoundUpButton: UIButton?
    
    var total: Double = 0.0
    @IBOutlet var totalTextField: UITextField?
    @IBOutlet var totalLabel: UILabel?
    @IBOutlet var totalRoundUpButton: UIButton?
    
    var num: Int = 1
    @IBOutlet var numTextField: UITextField?
    
    var scrollTag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        amountTextField!.inputAccessoryView = keyboardAccessoryView
        
        scrollerView!.configure()
        
        self.updateNumbers()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "Tips Calculator Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
    }
    
    override func viewDidAppear(animated: Bool) {
        amountTextField!.becomeFirstResponder()
        
        scrollerView!.setIndent()
        
        scrollTag = false
        scrollerView!.scrollTo(rate)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    func getRateString() -> NSString{
        var stringFormat: NSString = "%.1f%%"
        
        if (rate == 0.15) {
            return "推荐小费" + String(format: stringFormat, rate*100)
        }
        else {
            return String(format: stringFormat, rate*100)
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
        
        if (tips == Double(Int(tips))) {
            tipsRoundUpButton!.hidden = true
        }
        else {
            tipsRoundUpButton!.hidden = false
        }
        if (total == Double(Int(total))) {
            totalRoundUpButton!.hidden = true
        }
        else {
            totalRoundUpButton!.hidden = false
        }
        
        numTextField!.text = String(format: "%i", num)
        
    }
    
    func roundUp(num: Double) -> Double {
        let mid = (ceil(num)+floor(num)) / 2.0
        
        if (num >= mid) {
            return ceil(num)
        }
        else {
            return floor(num)
        }
    }
    
    func updateNumbers() {
        
        tips = amount * rate / Double(num)
        total = amount / Double(num) + tips
        
        self.updateViews()
    }
    
    func updateNumbersByTips() {
        
        rate = tips * Double(num) / amount
        
        total = amount / Double(num) + tips
        
        self.updateViews()
    }
    
    func updateNumbersByTotal() {
        
        rate = total * Double(num) / amount - 1.0
        
        tips = amount * rate / Double(num)
        
        self.updateViews()
    }
    
    
    // MARK: - IBAction
    
    @IBAction func doneButtonTapped() {
        amountTextField!.resignFirstResponder()
    }
    
    @IBAction func decRate() {
        
        //        let d = Double(rand() % 10) + 1
        let d = 5.0
        rate -= d / 100.0
        rate = Double(Int(rate*100)) / 100
        
        if (rate < 0.0) {
            rate = 0.0
        }
        
        self.updateNumbers()
        
        scrollTag = false
        scrollerView!.scrollTo(rate)
    }
    
    @IBAction func incRate() {
        
        //        let d = Double(rand() % 10) + 1
        let d = 5.0
        rate += d / 100.0
        rate = Double(Int(rate*100)) / 100
        
        if (rate > 1.0) {
            rate = 1.0
        }
        
        self.updateNumbers()
        
        scrollTag = false
        scrollerView!.scrollTo(rate)
    }
    
    @IBAction func decNum() {
        let n = NSString(string: numTextField!.text).integerValue
        
        if (n == 1) {
            return
        }
        
        num -= 1
        
        self.updateNumbers()
        
    }
    
    @IBAction func incNum() {
        let n = NSString(string: numTextField!.text).integerValue
        
        if (n == 99) {
            return
        }
        
        num += 1
        
        self.updateNumbers()
        
    }
    
    @IBAction func roundTips() {
        tips = self.roundUp(tips)
        
        self.updateNumbersByTips()
        
        scrollTag = false
        scrollerView!.scrollTo(rate)
    }
    
    @IBAction func roundTotal() {
        total = self.roundUp(total)
        
        self.updateNumbersByTotal()
        
        scrollTag = false
        scrollerView!.scrollTo(rate)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        amount = NSString(string: textField.text).doubleValue
        textField.text = NSString(format: "%.2f", amount)
        
        self.updateNumbers()
        
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
        
        self.updateNumbers()
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
