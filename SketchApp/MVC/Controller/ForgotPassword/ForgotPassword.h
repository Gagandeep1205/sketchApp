//
//  ForgotPassword.h
//  Sketch
//
//  Created by Gagandeep Kaur  on 10/08/15.
//  Copyright (c) 2015 Gagandeep Kaur . All rights reserved.
//

#import "Login.h"
#import "HomeScreen.h"
#import "LoginModal.h"
@interface ForgotPassword : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmitEmail;
@property (weak, nonatomic) IBOutlet UIView *viewSubmit;
@property (weak, nonatomic) IBOutlet UIButton *actionBtnSubmitEmail;
@property UIActivityIndicatorView *spinner;
@property NSDictionary * dicSuccess;
- (IBAction)actionBtnBack:(id)sender;

@end
