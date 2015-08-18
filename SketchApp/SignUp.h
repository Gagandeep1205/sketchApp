//
//  SignUp.h
//  SketchApp
//
//  Created by Kunal Gupta on 10/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreen.h"
#import "SignUpModal.h"

@interface SignUp : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfFullName;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfBirthday;
@property (weak, nonatomic) IBOutlet UITextField *tfPhoneNumber;
@property (weak, nonatomic) IBOutlet UIView *viewSubmit;
@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *btnBirthday;
@property (strong, nonatomic) NSString *strFullName;
@property (strong, nonatomic) NSString *strPassword;
@property (strong, nonatomic) NSString *strEmail;
@property (strong, nonatomic) NSString *strPhone;
@property (strong, nonatomic) NSString *strBirthday;
@property (strong, nonatomic) NSString *alertText;
@property (strong, nonatomic) NSString *alertMessage;
@property (strong, nonatomic) NSMutableDictionary *signUpParams;
@property (strong, nonatomic) NSDictionary * signupResponse;
@property UIActivityIndicatorView *spinner;
- (IBAction)actionBtnSubmit:(id)sender;
- (IBAction)actionBtnBack:(id)sender;
- (IBAction)pickerAction:(id)sender;
- (IBAction)actionBtnBirthday:(id)sender;
@end
