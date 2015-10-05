//
//  FeedbackViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class FeedbackViewController: GAITrackedViewController, UIAlertViewDelegate {
    
    @IBOutlet var navigationView: UIView?
    
    @IBOutlet var keyboardAccessoryView: UIView?
    
    @IBOutlet var textView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // GAITrackedViewController name
        self.screenName = "Feedback Screen"
        
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Transparent)
        navigationView!.backgroundColor! = UIColor.HLBlue(0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        textView!.inputAccessoryView = keyboardAccessoryView
        textView!.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    func sendFeedBackHandler(success: Bool) {
        if (success) {
            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                let alert = UIAlertView(title: "发送成功", message: "感谢您的反馈，我们会不断改进，努力满足您的需要！😄", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "好的")
                alert.tag = 1
                alert.show()
            })
        }
        else {
            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                let alert = UIAlertView(title: "发送失败", message: "网络错误，发送失败。😢", delegate: self, cancelButtonTitle: nil, otherButtonTitles: "好的")
                alert.tag = 2
                alert.show()
            })
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func sendButtonClicked() {
        DefaultAccessor.instance.sendFeedback(textView!.text, callback: sendFeedBackHandler)
    }
    
    @IBAction func blankTapped() {
        textView!.resignFirstResponder()
    }
    
    // MARK: - UIAlertViewDelegate
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if (alertView.tag == 1) {
        self.navigationController?.popViewControllerAnimated(true)
        }
        else {
            
        }
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
