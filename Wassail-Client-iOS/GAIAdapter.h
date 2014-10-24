//
//  GAIAdapter.h
//  Wassail-Client-iOS
//
//  Created by Chuan Ren on 10/23/14.
//  Copyright (c) 2014 Haile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIEcommerceProduct.h"
#import "GAIEcommerceProductAction.h"
#import "GAIEcommercePromotion.h"
#import "GAIFields.h"
#import "GAILogger.h"
#import "GAITrackedViewController.h"
#import "GAITracker.h"

@interface GAIAdapter : NSObject

+ (GAIAdapter *)instance;

- (void)initialize;

@end
