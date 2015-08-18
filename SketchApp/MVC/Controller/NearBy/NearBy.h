//
//  NearBy.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearbyCell.h"
#import "FeedModal.h"
#import <CoreLocation/CoreLocation.h>
#import "Macro.h"
#import "NearbyTextCell.h"
#import "UIScrollView+SVInfiniteScrolling.h"
#import "UIScrollView+SVPullToRefresh.h"
#import <UIImageView+WebCache.h>
@interface NearBy : UIViewController <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *nearbyFeedParams;
@property (strong, nonatomic) NSMutableArray *arrNearbyFeedResponse;
@property NSString *userAccessToken;
@property CLLocationManager *locationManager;
@property NSString* currentLat;
@property NSString* currentLng;
@property int pageNo;
@property int pageSize;
@property (strong, nonatomic) NSString * dicValuePageNo;
@property (strong, nonatomic) NSString * dicValuePageSize;
@property NSMutableArray *arrTableData;
@property NSIndexPath *currentIndexPath;
@end
