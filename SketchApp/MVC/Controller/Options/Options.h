//
//  Options.h
//  SketchApp
//
//  Created by Kunal Gupta on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Options : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *switchPrivateAccount;
@property (weak, nonatomic) IBOutlet UISwitch *switchSavePhotos;
@property (weak, nonatomic) IBOutlet UISwitch *switchSaveVideos;
@property (weak, nonatomic) IBOutlet UISwitch *switchCellularData;
@property (weak, nonatomic) IBOutlet UISwitch *swicthNoti1;
@property (weak, nonatomic) IBOutlet UISwitch *switchFirePost;
- (IBAction)actionBtnBack:(id)sender;

@end
