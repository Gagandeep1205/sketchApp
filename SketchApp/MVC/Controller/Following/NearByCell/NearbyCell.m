//
//  NearbyCell.m
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "NearbyCell.h"

@implementation NearbyCell

- (void)awakeFromNib {
    // Initialization code
    self.imgUserPic.layer.cornerRadius = self.imgUserPic.frame.size.width / 2;
    self.imgUserPic.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionBtnLike:(id)sender {
}

- (IBAction)actionBtnDislike:(id)sender {
}

- (IBAction)actionBtnChats:(id)sender {
}
@end
