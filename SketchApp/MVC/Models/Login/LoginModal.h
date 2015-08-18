//
//  LoginModal.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 12/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iOSRequest.h"

@interface LoginModal : NSObject
-(void) login : (NSString *)userName : (NSString *)password :(void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure ;

- (void)loginUser : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;

- (void)forgotPassword : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;

@end
