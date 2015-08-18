//
//  LoginModal.m
//  SketchApp
//
//  Created by Gagandeep Kaur  on 12/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "LoginModal.h"

@implementation LoginModal
-(void) login : (NSString *)userName : (NSString *)password :(void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure {

    [iOSRequest getJSONResponse:[NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/api/login?id=%@&password=%@", userName, password] :^(NSDictionary *response_success){
        success(response_success);
    }:^(NSError* response_error){
        
        failure(response_error);
    }];
}
- (void)loginUser : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure {
    
    [iOSRequest postData:[NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/api/login?"] :parameters :^(NSDictionary *response_success) {
        success(response_success);
    } :^(NSError *response_error) {
        failure(response_error);
    }];
}
- (void)forgotPassword : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure {
    
    [iOSRequest postData:[NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/api/forgot-password?"] :parameters :^(NSDictionary *response_success) {
        success(response_success);
    } :^(NSError *response_error) {
        failure(response_error);
    }];
}


@end
