//
//  TimeLIne.h
//  SketchApp
//
//  Created by Kunal Gupta on 10/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearBy.h"
#import "Following.h"
#import "UserProfile.h"
#import "Search.h"
#import "ShootVC.h"
@interface TimeLIne : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate, UITabBarDelegate, UITabBarControllerDelegate>

#pragma mark outlets

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *tabItemHome;
@property (weak, nonatomic) IBOutlet UITabBarItem *tabItemShoot;
@property (weak, nonatomic) IBOutlet UITabBarItem *tabItemDiscover;
@property (weak, nonatomic) IBOutlet UIView *viewNavBar;
@property (weak, nonatomic) IBOutlet UIButton *btnNearby;
@property (weak, nonatomic) IBOutlet UIButton *btnFollowing;
@property (weak, nonatomic) IBOutlet UIView *viewPlaceholder;
@property (strong, nonatomic) UIPageViewController * pageController;
@property NSArray *viewControllers;

#pragma mark button actions

- (IBAction)actionButtonUser:(id)sender;
- (IBAction)actionBtnBell:(id)sender;
- (IBAction)actionBtnSearch:(id)sender;
- (IBAction)actionBtnNearby:(id)sender;
- (IBAction)actionBtnFollowing:(id)sender;



@end
