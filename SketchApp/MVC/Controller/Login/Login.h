//
//  ViewController.h
//  Sketch
//
//  Created by Gagandeep Kaur  on 10/08/15.
//  Copyright (c) 2015 Gagandeep Kaur . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForgotPassword.h"
#import "HomeScreen.h"
#import "TimeLIne.h"
#import "LoginModal.h"
#import "Following.h"
#import "NearBy.h"
#import "Macro.h"

@interface Login: UIViewController <UIAlertViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (strong, nonatomic) NSDictionary *loginResponse;
@property (weak, nonatomic) IBOutlet UIView *viewForm;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property UIActivityIndicatorView *spinner;
@property (strong, nonatomic) NSString *accessToken;

- (IBAction)actionBtnForgotPassword:(id)sender;
- (IBAction)actionBtnBack:(id)sender;
- (IBAction)actionBtnSubmit:(id)sender;
@end

