//
//  UserProfile.h
//  SketchApp
//
//  Created by Kunal Gupta on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfilePicCell.h"
#import "PostCell.h"
#import "Options.h"
@interface UserProfile : UIViewController<UITableViewDataSource, UITableViewDelegate>
- (IBAction)actionBtnSettings:(id)sender;
- (IBAction)actionBtnBack:(id)sender;
@end
