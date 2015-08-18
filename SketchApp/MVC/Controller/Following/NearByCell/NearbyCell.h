//
//  NearbyCell.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelUsername;
@property (weak, nonatomic) IBOutlet UIImageView *imgUserPic;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UILabel *labelPost;
@property (weak, nonatomic) IBOutlet UILabel *labelCountLikes;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) IBOutlet UIButton *btnDislike;

- (IBAction)actionBtnLike:(id)sender;
- (IBAction)actionBtnDislike:(id)sender;
- (IBAction)actionBtnChats:(id)sender;
@end
