//
//  AWSAdapter.swift
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 9/12/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

import UIKit

private let _AWSAdapterSharedInstance = AWSAdapter()

class AWSAdapter: NSObject, NSURLSessionTaskDelegate {
        
    class var instance : AWSAdapter {
    return _AWSAdapterSharedInstance
    }
    
    func initialize() {
        
        // Cognito
        AWSCognitoAdapter.instance().initCredentialProvider()
        
        // Mobile Analytics
        AWSMobileAnalyticsAdapter.instance().initAnalytics()
    }
    
}
