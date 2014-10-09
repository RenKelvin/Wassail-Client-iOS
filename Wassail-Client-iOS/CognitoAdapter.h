//
//  CognitoAdapter.h
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AWSiOSSDKv2/AWSCore.h>
#import <AWSCognitoSync/Cognito.h>

#import <AWSiOSSDKv2/AWSMobileAnalytics.h>

@interface CognitoAdapter : NSObject {
    
    AWSCognitoCredentialsProvider* _credentialsProvider;
    
}

+ (CognitoAdapter *)instance;

- (void)initCredentialProvider;

@end
