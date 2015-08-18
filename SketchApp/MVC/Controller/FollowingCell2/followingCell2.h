//
//  followingCell2.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 18/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface followingCell2 : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelUsername;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeSince;
@property (weak, nonatomic) IBOutlet UILabel *labelPost;
@property (weak, nonatomic) IBOutlet UILabel *labelLikeCount;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) IBOutlet UIButton *btnDislike;
@property (weak, nonatomic) IBOutlet UIButton *btnComments;

- (IBAction)actionBtnLike:(id)sender;
- (IBAction)actionBtnDislike:(id)sender;
- (IBAction)actionBtnComments:(id)sender;
@end
