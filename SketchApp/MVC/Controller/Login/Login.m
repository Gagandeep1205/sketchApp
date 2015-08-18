//
//  ViewController.m
//  Sketch
//
//  Created by Gagandeep Kaur  on 10/08/15.
//  Copyright (c) 2015 Gagandeep Kaur . All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:_viewForm];
    [self loadingIndicator];
    }
-(void)loadingIndicator{
    
    _spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_spinner setCenter:self.view.center];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) alert : (NSString *)errMessage{
   [[[UIAlertView alloc]initWithTitle:@"Error" message:errMessage delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil]show];
    
}


#pragma mark TextField delegates

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([_tfUsername isFirstResponder]){
        [UIView animateWithDuration:.2 animations:^{
            _viewForm.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    }
    else{
    
        [UIView animateWithDuration:.3 animations:^{
            _viewForm.transform = CGAffineTransformMakeTranslation(0, -100);
         //   _btnSubmit.transform = CGAffineTransformMakeTranslation(0, -253);
        }];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
    [UIView animateWithDuration:.2 animations:^{
        _viewForm.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField{

    if ([_tfUsername isFirstResponder]) {
        [_tfPassword becomeFirstResponder ];
        [UIView animateWithDuration:.3 animations:^{
            _viewForm.transform = CGAffineTransformMakeTranslation(0, -100);
      
        }];
    }
    else{
        [UIView animateWithDuration:.2 animations:^{
            _viewForm.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        [self.view endEditing:YES];
    }
    return YES;
}

#pragma mark Button Actions

- (IBAction)actionBtnSubmit:(id)sender {
    NSString *trimmedUsername = [_tfUsername.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *trimmedPassword = [_tfPassword.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimmedUsername isEqualToString:@""]){
        [self alert: [NSString stringWithFormat:@"Please enter a Username"]];
    }
    else if([trimmedPassword isEqualToString:@""]){
        [self alert: [NSString stringWithFormat:@"Please enter a Password"]];
    }
    else{
        [_spinner startAnimating];
        UIView *viewBackground = [[UIView alloc]init];
        viewBackground.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        viewBackground.backgroundColor = [UIColor blackColor];
        viewBackground.alpha = 0.5;
        [self.view addSubview:viewBackground];
        [viewBackground addSubview:_spinner];
        
        _loginResponse = [[NSDictionary alloc]init];
        LoginModal * loginmodal= [[LoginModal alloc] init];
        NSMutableDictionary * dicLoginParams = [[NSMutableDictionary alloc]init];
        [dicLoginParams setObject:trimmedUsername forKey:@"id"];
        [dicLoginParams setObject:trimmedPassword forKey:@"password"];
        [loginmodal loginUser:dicLoginParams :^(NSDictionary *response_success) {
            
            _loginResponse = response_success;
            if ([[_loginResponse valueForKey:@"success"] integerValue] == 1){
                [_spinner stopAnimating];
                _accessToken = [_loginResponse valueForKey:@"access_token"];
                UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                TimeLIne * VC = [storyboard instantiateViewControllerWithIdentifier:@"TimeLIne"];
                [[NSUserDefaults standardUserDefaults] setObject:[_loginResponse valueForKey:@"access_token"] forKey:UD_Token];
                [self.navigationController pushViewController:VC animated:true];
            }
            else {
                [_spinner stopAnimating];
                viewBackground.hidden = true;
                [[[UIAlertView alloc]initWithTitle:@"Error" message:[_loginResponse valueForKey:@"msg"] delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:nil]show];
            }
            
        } :^(NSError *response_error) {
            
        }];
        
    }
}

- (IBAction)actionBtnForgotPassword:(id)sender {
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ForgotPassword * VC = [storyBoard instantiateViewControllerWithIdentifier:@"ForgotPassword"];
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)actionBtnBack:(id)sender {

    [self.navigationController popToRootViewControllerAnimated:true];
}
@end
