//
//  TimeLIne.m
//  SketchApp
//
//  Created by Kunal Gupta on 10/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "TimeLIne.h"

@interface TimeLIne ()

@end

@implementation TimeLIne

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPageController];
    [self.tabBar setSelectedItem:_tabItemHome];
    self.tabBar.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - page view controller

-(void)addPageController {
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    
    [[self.pageController view] setFrame:CGRectMake(0, 0, self.viewPlaceholder.frame.size.width, self.viewPlaceholder.frame.size.height)];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    NearBy *first = [storyboard instantiateViewControllerWithIdentifier:@"NearBy"];
    NSArray *viewControllers = [NSArray arrayWithObject:first];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [self.viewPlaceholder addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
}

#pragma mark - View Controller before View

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    if ([viewController isKindOfClass:[Following class]]){
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        NearBy *request = [storyboard instantiateViewControllerWithIdentifier:@"NearBy"];
        return  request;
        
    }
    else{
    
        return nil;
    }
}


#pragma mark - View Controller after View


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    if ([viewController isKindOfClass:[NearBy class]]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        Following *lockDown = [storyboard instantiateViewControllerWithIdentifier:@"Following"];
        return  lockDown;
    }
    else{
        
        return nil;
    }
    
}

- (IBAction)actionButtonUser:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UserProfile *VC = [storyBoard instantiateViewControllerWithIdentifier:@"UserProfile"];
    [self.navigationController pushViewController:VC animated:true];
}

- (IBAction)actionBtnBell:(id)sender {
}

- (IBAction)actionBtnSearch:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Search *VC = [storyBoard instantiateViewControllerWithIdentifier:@"Search"];
    [self.navigationController pushViewController:VC animated:true];
}

- (IBAction)actionBtnNearby:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    NearBy *lockDown = [storyboard instantiateViewControllerWithIdentifier:@"NearBy"];
    if (self.pageController.view != lockDown.view){
        
    _viewControllers = [[NSArray alloc]initWithObjects:lockDown, nil];
    [self.pageController setViewControllers:_viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
    
}

- (IBAction)actionBtnFollowing:(id)sender {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    Following *lockDown = [storyboard instantiateViewControllerWithIdentifier:@"Following"];
    if (self.pageController.view != lockDown.view){
        
        _viewControllers = [[NSArray alloc]initWithObjects:lockDown, nil];
        [self.pageController setViewControllers:_viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
}
#pragma mark - tabBar delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(_tabBar.selectedItem.tag == 1){
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ShootVC * VC = [storyboard instantiateViewControllerWithIdentifier:@"ShootVC"];
        [self.navigationController pushViewController:VC animated:true];
    }
}
@end
