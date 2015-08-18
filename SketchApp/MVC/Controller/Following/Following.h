//
//  Following.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowingCell.h"
#import "followingCell2.h"
#import "FeedModal.h"
#import "Login.h"
#import "Macro.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "UIScrollView+SVPullToRefresh.h"
#import <UIImageView+WebCache.h>

@interface Following : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *feedParams;
@property NSMutableArray * arrFeedResponse;
@property (strong, nonatomic) NSString * uesrAccessToken;
@property int pageNo;
@property int pageSize;
@property (strong, nonatomic) NSString * dicValuePageNo;
@property (strong, nonatomic) NSString * dicValuePageSize;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property NSMutableArray *arrTableData;
@end
