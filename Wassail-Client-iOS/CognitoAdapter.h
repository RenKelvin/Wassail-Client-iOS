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

@interface CognitoAdapter : NSObject {
    
    AWSCognitoCredentialsProvider* _credentialsProvider;
    
}

- (void)docognito;

@end
