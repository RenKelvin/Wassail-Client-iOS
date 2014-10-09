//
//  CognitoAdapter.m
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/8/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

#import "AWSCognitoAdapter.h"

@implementation AWSCognitoAdapter

static AWSCognitoAdapter * _AWSCognitoAdapterSharedInstance = nil;    // static instance variable

+ (AWSCognitoAdapter *)instance {
    
    if (_AWSCognitoAdapterSharedInstance == nil) {
        _AWSCognitoAdapterSharedInstance = [[super allocWithZone:NULL] init];
    }
    return _AWSCognitoAdapterSharedInstance;
}

- (void)initCredentialProvider {
    
    _credentialsProvider = [AWSCognitoCredentialsProvider
                            credentialsWithRegionType:AWSRegionUSEast1
                            accountId:@"904179507614"
                            identityPoolId:@"us-east-1:1994fb86-c0d9-4b08-b93e-4fe9f68fde63"
                            unauthRoleArn:@"arn:aws:iam::904179507614:role/Cognito_WassailUnauth_DefaultRole"
                            authRoleArn:@"arn:aws:iam::904179507614:role/Cognito_WassailAuth_DefaultRole"];
    
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSEast1 credentialsProvider:_credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    
    [[_credentialsProvider getIdentityId] continueWithSuccessBlock: ^id(BFTask *task) {
        _cognitoId = _credentialsProvider.identityId;
        NSLog(@"cognitoId: %@", _cognitoId);
        return nil;
    }];
    
}

@end
