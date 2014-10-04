//
//  FeedbackViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/21/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    @IBOutlet var navigationView: UIView?

    @IBOutlet var keyboardAccessoryView: UIView?

    let info: FeedbackInfo = FeedbackInfo.instance
    
    @IBOutlet var textView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {

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
    
    @IBAction func sendButtonClicked() {

        textView!.resignFirstResponder()
        
        self.navigationController?.popViewControllerAnimated(true)
        
        info.sendFeedback(textView!.text)
    }
    
    @IBAction func blankTapped() {

        textView!.resignFirstResponder()

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
