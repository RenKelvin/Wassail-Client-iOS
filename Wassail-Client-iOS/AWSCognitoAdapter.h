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

@interface AWSCognitoAdapter : NSObject {
    
    NSString* _cognitoId;
    
    AWSCognitoCredentialsProvider* _credentialsProvider;
    
}

+ (AWSCognitoAdapter *)instance;

- (void)initCredentialProvider;

@end
