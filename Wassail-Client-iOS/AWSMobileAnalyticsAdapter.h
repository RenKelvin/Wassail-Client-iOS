//
//  AWSMobileAnalyticsAdapter.h
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/9/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AWSiOSSDKv2/AWSMobileAnalytics.h>

@interface AWSMobileAnalyticsAdapter : NSObject {
    
    AWSMobileAnalytics* _analytics;
    
}

+ (AWSMobileAnalyticsAdapter *)instance;

- (void)initAnalytics;

@end
