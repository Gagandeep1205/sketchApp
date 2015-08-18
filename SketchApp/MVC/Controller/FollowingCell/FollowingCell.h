//
//  FollowingCell.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedModal.h"

@interface FollowingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelUsername;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserPic;
@property (weak, nonatomic) IBOutlet UILabel *labelPostTime;
@property (weak, nonatomic) IBOutlet UILabel *labelPost;
@property (weak, nonatomic) IBOutlet UILabel *labelLikesCount;
@property (weak, nonatomic) IBOutlet UIButton *btnIsliked;
@property (weak, nonatomic) IBOutlet UIButton *btnIsDisliked;

- (IBAction)actionBtnLike:(id)sender;
- (IBAction)actionBtnDislike:(id)sender;
- (IBAction)actionBtnChat:(id)sender;

@end
