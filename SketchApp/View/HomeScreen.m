//
//  HomeScreen.m
//  SketchApp
//
//  Created by Kunal Gupta on 10/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "HomeScreen.h"

@interface HomeScreen ()

@end

@implementation HomeScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionBtnSignUp:(id)sender {
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignUp * VC = [storyBoard instantiateViewControllerWithIdentifier:@"SignUp"];
 //   [VC getFlag:value];
      //[self presentViewController:VC animated:YES completion:nil];
    [self.navigationController pushViewController:VC animated:YES];
}

- (IBAction)actionBtnLogin:(id)sender {
    
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Login * VC = [storyBoard instantiateViewControllerWithIdentifier:@"Login"];
    [self.navigationController pushViewController:VC animated:YES];
}
@end
