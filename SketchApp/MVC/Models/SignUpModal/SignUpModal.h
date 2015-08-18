//
//  SignUpModal.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 12/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iOSRequest.h"

@interface SignUpModal : NSObject

- (void)signUpUser : (NSDictionary *)parameters : (void(^)(NSDictionary * response_success))success : (void(^)(NSError * response_error))failure;

@end
