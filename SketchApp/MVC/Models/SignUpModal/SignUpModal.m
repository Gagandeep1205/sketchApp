//
//  SignUpModal.m
//  SketchApp
//
//  Created by Gagandeep Kaur  on 12/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "SignUpModal.h"

@implementation SignUpModal

- (void)signUpUser : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure {
    
    [iOSRequest postData:[NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/api/signup?"] :parameters :^(NSDictionary *response_success) {
        success(response_success);
    } :^(NSError *response_error) {
        failure(response_error);
    }];
}

@end
