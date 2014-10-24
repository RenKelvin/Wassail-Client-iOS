//
//  GAIAdapter.m
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/23/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

#import "GAIAdapter.h"

@implementation GAIAdapter

static GAIAdapter * _GAIAdapterSharedInstance = nil;    // static instance variable

+ (GAIAdapter *)instance {
    
    if (_GAIAdapterSharedInstance == nil) {
        _GAIAdapterSharedInstance = [[super allocWithZone:NULL] init];
    }
    return _GAIAdapterSharedInstance;
}

- (void)initialize {
    
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel: 2];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-56022183-1"];

}

@end
