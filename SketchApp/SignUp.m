//
//  SignUp.m
//  SketchApp
//
//  Created by Kunal Gupta on 10/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "SignUp.h"

UIAlertView *alert;
@interface SignUp ()

@end

@implementation SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeStrings];
    // Do any additional setup after loading the view.
}

-(void) initializeStrings{
    _strFullName = @"";
    _strPhone = @"";
    _strEmail = @"";
    _strBirthday =@"";
    _alertMessage = @"";
    _alertText = @"";
    _strPassword = @"";
    
    _datePicker.maximumDate = [NSDate date];
    [self.tfFullName setValue:[UIColor yellowColor]
                    forKeyPath:@"_placeholderLabel.textColor"];
    [self.tfEmail setValue:[UIColor yellowColor]
                   forKeyPath:@"_placeholderLabel.textColor"];
    [self.tfBirthday setValue:[UIColor yellowColor]
                   forKeyPath:@"_placeholderLabel.textColor"];
    [self.tfPhoneNumber setValue:[UIColor yellowColor]
                   forKeyPath:@"_placeholderLabel.textColor"];
    [self.tfPassword setValue:[UIColor yellowColor]
                      forKeyPath:@"_placeholderLabel.textColor"];
    [_btnBirthday setTitle:@"Birthday" forState:UIControlStateNormal];
    
    _btnBirthday.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    _datePicker.hidden = true;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    _spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_spinner setCenter:self.view.center];
}
- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:true];
    _btnSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
}
- (BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark - Text Field Delegates


#define MAXLENGTH 10

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if(textField == _tfPhoneNumber) {
    
        if ([_tfPhoneNumber.text length] > MAXLENGTH) {
            
            textField.text = [textField.text substringToIndex:MAXLENGTH-1];
            return NO;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if([_tfFullName isFirstResponder]){
        [_tfEmail becomeFirstResponder];
        _datePicker.hidden = true;
    }
    else if([_tfEmail isFirstResponder]){

        [_tfPassword becomeFirstResponder];
        _datePicker.hidden = true;
    }
    else if([_tfPassword isFirstResponder]){
        
        [self.view endEditing:true];
        [UIView animateWithDuration:.2 animations:^{
            self.viewMain.transform = CGAffineTransformMakeTranslation(0, 0);
            self.btnSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
            _datePicker.hidden = false;
        }];
        
    }
    return YES;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    if([_tfFullName isFirstResponder])
    {
        _datePicker.hidden = true;
    }
    else if ([_tfEmail isFirstResponder]){
        _datePicker.hidden = true;
    }
    else if([_tfPhoneNumber isFirstResponder]){
        _datePicker.hidden = true;
    }
    [UIView animateWithDuration:.2 animations:^{
        self.btnSubmit.transform = CGAffineTransformMakeTranslation(0, -125);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alert{
    [[[UIAlertView alloc]initWithTitle:@"Error" message:_alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
}

#pragma mark - Action Button

- (IBAction)actionBtnSubmit:(id)sender {
    
    
    [self.view endEditing:true];
    _datePicker.hidden = true;
    
    [UIView animateWithDuration:.3 animations:^{
        self.btnSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    _strFullName = [_tfFullName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    _strEmail = [_tfEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    _strPhone = _tfPhoneNumber.text;
    _strPassword = _tfPassword.text;
    
    NSMutableCharacterSet *allowedSet = [NSMutableCharacterSet characterSetWithCharactersInString:@"_"];
    [allowedSet formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
    NSCharacterSet *forbiddenSet = [allowedSet invertedSet];
    NSRange range = [_tfFullName.text rangeOfCharacterFromSet:forbiddenSet];
    
    if([_strFullName  isEqual: @""]){
        _alertMessage = @"Please fill your name";
        [self alert];
    }
    else if([_strEmail  isEqual: @""]){
        _alertMessage = @"Please fill your Email ID";
        [self alert];
    }
    else if (range.location != NSNotFound){
        
        _alertMessage = @"Username contains illegal characters. Only alphanumeric and '_' are allowed.";
        [self alert];
    }
    else if([_strPassword isEqual:@""]){
        _alertMessage = @"Please fill your Password";
        [self alert];
    }
    else if([_strBirthday isEqual:@""]){
        _alertMessage = @" Please Enter you Birthday";
        [self alert];
    }
    else if([_strPhone isEqual:@""]){
        _alertMessage = @" Please Enter you Phone NUmber";
        [self alert];
    }
    else if(![self NSStringIsValidEmail:_strEmail]){
        _alertMessage = @" Please Enter a valid Email";
        [self alert];
    }
    else if (_strPhone.length <10){
            _alertMessage = @"Please Enter a Valid Phone Number";
            [self alert];
    }
        else{
            [_spinner startAnimating];
            UIView *viewBackground = [[UIView alloc]init];
            viewBackground.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            viewBackground.backgroundColor = [UIColor blackColor];
            viewBackground.alpha = 0.4;
            [self.view addSubview:viewBackground];
            [viewBackground addSubview:_spinner];

        SignUpModal *signUp= [[SignUpModal alloc] init];
        _signUpParams = [[NSMutableDictionary alloc]init];
        [_signUpParams setObject:_strFullName forKey:@"username"];
        [_signUpParams setObject:_strPassword forKey:@"password"];
        [_signUpParams setObject:_strEmail forKey:@"email"];
        [_signUpParams setObject:_strBirthday forKey:@"birthday"];
        [_signUpParams setObject:_strPhone forKey:@"phone"];
        _signupResponse = [[NSDictionary alloc]init];
        
        [signUp signUpUser:_signUpParams :^(NSDictionary *response_success) {
            
            _signupResponse = response_success;
            if ([[_signupResponse valueForKey:@"success" ] integerValue] == 1) {
                [_spinner stopAnimating];
                viewBackground.hidden = true;

                [[[UIAlertView alloc]initWithTitle:@"Success!" message:[_signupResponse valueForKey:@"msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
                 [self.navigationController popToRootViewControllerAnimated:true];
            }
            else{
                [_spinner stopAnimating];
                viewBackground.hidden = true;

                [[[UIAlertView alloc]initWithTitle:@"Error!" message:[_signupResponse valueForKey:@"msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            }
        
        } :^(NSError *response_error) {
        }];
    }
}

- (IBAction)actionBtnBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (IBAction)pickerAction:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *formatedDate = [dateFormatter stringFromDate:self.datePicker.date];
    [_btnBirthday setTitle:formatedDate forState:UIControlStateNormal];
    _strBirthday = formatedDate;
}

- (IBAction)actionBtnBirthday:(id)sender {
    _datePicker.hidden = false;
    [self.view endEditing:true];
    [UIView animateWithDuration:.3 animations:^{
        self.btnSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}
@end
