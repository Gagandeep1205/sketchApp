//
//  Search.m
//  SketchApp
//
//  Created by Kunal Gupta on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "Search.h"

@interface Search ()

@end

@implementation Search

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma text  - Text Field Delegates

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:true];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)actionBtnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:true];

}

@end
