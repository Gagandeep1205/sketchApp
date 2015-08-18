//
//  HomeScreen.h
//  SketchApp
//
//  Created by Kunal Gupta on 10/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUp.h"
#import "Login.h"
@interface HomeScreen : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnSignUp;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
- (IBAction)actionBtnSignUp:(id)sender;

- (IBAction)actionBtnLogin:(id)sender;

@end
