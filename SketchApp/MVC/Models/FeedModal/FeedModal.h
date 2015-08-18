//
//  FeedModal.h
//  SketchApp
//
//  Created by Kunal Gupta on 17/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iOSRequest.h"

@interface FeedModal : NSObject

- (void)followingFeed : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;

- (void)nearbyFeed : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;
@end
