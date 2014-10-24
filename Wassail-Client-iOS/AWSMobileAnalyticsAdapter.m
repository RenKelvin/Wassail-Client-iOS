//
//  AWSMobileAnalyticsAdapter.m
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/9/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

#import "AWSMobileAnalyticsAdapter.h"

@implementation AWSMobileAnalyticsAdapter

static AWSMobileAnalyticsAdapter * _AWSMobileAnalyticsAdapterSharedInstance = nil;    // static instance variable

+ (AWSMobileAnalyticsAdapter *)instance {
    
    if (_AWSMobileAnalyticsAdapterSharedInstance == nil) {
        _AWSMobileAnalyticsAdapterSharedInstance = [[super allocWithZone:NULL] init];
    }
    return _AWSMobileAnalyticsAdapterSharedInstance;
}

- (void)initAnalytics {
    
    //    _analytics = [AWSMobileAnalytics mobileAnalyticsForAppId:@"7a9e6aac52f24ee984cbead1c4e74766"];
    _analytics = [AWSMobileAnalytics mobileAnalyticsForAppId:@"4275b64634ed40329c9e86dd8974415b"];
    
}

@end
