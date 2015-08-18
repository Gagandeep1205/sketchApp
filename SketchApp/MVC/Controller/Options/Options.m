//
//  Options.m
//  SketchApp
//
//  Created by Kunal Gupta on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "Options.h"


@interface Options ()

@end

@implementation Options

- (void)viewDidLoad {
    [super viewDidLoad];
    _switchPrivateAccount.transform = CGAffineTransformMakeScale(.5, .5);
    _switchSavePhotos.transform = CGAffineTransformMakeScale(.5, .5);
    _switchSaveVideos.transform = CGAffineTransformMakeScale(.5, .5);
    _switchCellularData.transform = CGAffineTransformMakeScale(.5, .5);
    _swicthNoti1.transform = CGAffineTransformMakeScale(.5, .5);
    _switchFirePost.transform = CGAffineTransformMakeScale(.5, .5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)actionBtnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
    
}
@end
