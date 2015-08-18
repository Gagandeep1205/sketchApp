//
//  ForgotPassword.m
//  Sketch
//
//  Created by Gagandeep Kaur  on 10/08/15.
//  Copyright (c) 2015 Gagandeep Kaur . All rights reserved.
//

#import "ForgotPassword.h"

@interface ForgotPassword ()

@end

@implementation ForgotPassword

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:_viewSubmit];
    [self.tfEmail setValue:[UIColor yellowColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self loadingIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadingIndicator{
    _spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_spinner setCenter:self.view.center];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [UIView animateWithDuration:.3 animations:^{
        _viewSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
        _btnSubmitEmail.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    [self.view endEditing:YES];
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

#pragma mark TextField delegates

- (void)textFieldDidBeginEditing:(UITextField *)textField{
        [UIView animateWithDuration:.3 animations:^{
            _viewSubmit.transform = CGAffineTransformMakeTranslation(0, -100);
            _btnSubmitEmail.transform = CGAffineTransformMakeTranslation(0, -253);
        }];
}

- (IBAction)actionBtnSubmitEmail:(id)sender {
    [UIView animateWithDuration:.3 animations:^{
        _viewSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
        _btnSubmitEmail.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
         [self.view endEditing:YES];
     _btnSubmitEmail.transform = CGAffineTransformMakeTranslation(0, 0);
    NSString *trimmedEmail = [_tfEmail.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimmedEmail isEqualToString:@""]) {
        
        [[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Enter an Email" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil]show];
    }
    else if (![self NSStringIsValidEmail:trimmedEmail]){
    
        [[[UIAlertView alloc]initWithTitle:@"Error" message:@"Please Enter a valid Email" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil]show];
    }
    else{
        
        [_spinner startAnimating];
        UIView *viewBackground = [[UIView alloc]init];
        viewBackground.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        viewBackground.backgroundColor = [UIColor blackColor];
        viewBackground.alpha = 0.5;
        [self.view addSubview:viewBackground];
        [viewBackground addSubview:_spinner];
        
        LoginModal * loginmodal= [[LoginModal alloc] init];
        _dicSuccess = [[NSDictionary alloc]init];
        NSMutableDictionary * dicForgotPassParams = [[NSMutableDictionary alloc]init];
        [dicForgotPassParams setObject:trimmedEmail forKey:@"email"];
        [loginmodal forgotPassword:dicForgotPassParams :^(NSDictionary *response_success) {
            _dicSuccess = response_success ;
            
            if ([[_dicSuccess valueForKey:@"success"]  isEqual:@"1"]) {
                [_spinner stopAnimating];
                viewBackground.hidden = true;
                [[[UIAlertView alloc]initWithTitle:@"Success" message:[_dicSuccess valueForKey:@"msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            }
            else{
                [_spinner stopAnimating];
                viewBackground.hidden = true;
                
                [[[UIAlertView alloc]initWithTitle:@"Error" message:[_dicSuccess valueForKey:@"msg"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
            }
        } :^(NSError *response_error) {
            
        }];
    }

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {
       
        _tfEmail.text = @"";
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{

    if ([_tfEmail isFirstResponder]) {
        
        [UIView animateWithDuration:.3 animations:^{
            _viewSubmit.transform = CGAffineTransformMakeTranslation(0, 0);
            _btnSubmitEmail.transform = CGAffineTransformMakeTranslation(0, 0);
            [self.view endEditing:YES];
        }];
    }
    return YES;
}
- (IBAction)actionBtnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:true];

}
@end
