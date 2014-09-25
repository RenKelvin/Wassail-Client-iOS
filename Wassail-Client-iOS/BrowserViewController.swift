//
//  BrowserViewController.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/25/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView?

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var urlLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let url = NSURL(string: "http://www.baidu.com")
        let request = NSURLRequest(URL: url)
        
        webView!.loadRequest(request)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Configure Navigation Bar and Status Bar
        self.setNavigationBarStyle(HLNavigationBarStyle.Default)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UIWebViewDelegate
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        self.titleLabel!.text = webView.stringByEvaluatingJavaScriptFromString("document.title")
        self.urlLabel!.text = request.URL.absoluteString!
        
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
