//
//  FeedModal.m
//  SketchApp
//
//  Created by Kunal Gupta on 17/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "FeedModal.h"

@implementation FeedModal

- (void)followingFeed : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure {
    
    [iOSRequest postData:[NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/api/following-feeds?"] :parameters :^(NSDictionary *response_success) {
        success(response_success);
    } :^(NSError *response_error) {
        failure(response_error);
    }];
}

- (void)nearbyFeed : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure {
    
    [iOSRequest postData:[NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/api/nearby-feeds?"] :parameters :^(NSDictionary *response_success) {
        success(response_success);
    } :^(NSError *response_error) {
        failure(response_error);
    }];
}
@end
