//
//  NearBy.m
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "NearBy.h"

@interface NearBy ()

@end

@implementation NearBy

- (void)viewDidLoad {
    [super viewDidLoad];
    _userAccessToken = [[NSUserDefaults standardUserDefaults] valueForKey:UD_Token];
    _arrTableData = [[NSMutableArray alloc]init];
    [self getLocation];
    [self getNearbyFeed:_userAccessToken];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    _userAccessToken = [[NSUserDefaults standardUserDefaults] valueForKey:UD_Token];
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        _pageNo = 1;
        _pageSize = 10;
        [self getNearbyFeed:_userAccessToken];
        
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
        _pageNo ++;
        [self getNearbyFeed:_userAccessToken];
        
    }];
    
}


- (void) getLocation{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
    CLLocation *location = [_locationManager location];
    _currentLat = [NSString stringWithFormat:@"%f",location.coordinate.latitude];
    _currentLng = [NSString stringWithFormat:@"%f",location.coordinate.longitude];
}

- (void)viewDidAppear:(BOOL)animated {
    [_tableView triggerPullToRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getNearbyFeed : (NSString *)accessToken{
    
    _nearbyFeedParams = [[NSMutableDictionary alloc]init];
    _dicValuePageNo = [NSString stringWithFormat:@"%d", _pageNo];
    _dicValuePageSize = [NSString stringWithFormat: @"%d", _pageSize];
    [_nearbyFeedParams setObject:accessToken forKey:@"access_token"];
    [_nearbyFeedParams setObject:_dicValuePageNo forKey:@"page_no"];
    [_nearbyFeedParams setObject:_dicValuePageSize forKey:@"page_size"];
    [_nearbyFeedParams setObject:_currentLat forKey:@"latitude"];
    [_nearbyFeedParams setObject:_currentLng forKey:@"longitude"];

    FeedModal * feed = [[FeedModal alloc]init];
    [feed nearbyFeed:_nearbyFeedParams :^(NSDictionary *response_success) {
        
        _arrNearbyFeedResponse = [response_success valueForKey:@"data"];
        [_arrTableData arrayByAddingObjectsFromArray:_arrNearbyFeedResponse];
        [_tableView reloadData];
        [_tableView.pullToRefreshView stopAnimating];
        NSLog(@"%@", response_success);
    } :^(NSError *response_error) {
        NSLog(@"%@", response_error);
        [_tableView.pullToRefreshView stopAnimating];
    }];
    
}

#pragma mark table view dataSources and dalegates

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrTableData.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[[_arrTableData valueForKey:@"image" ]objectAtIndex:indexPath.row] isEqual:@""]||[[[_arrTableData valueForKey:@"image"]objectAtIndex:indexPath.row ] isEqual:@"noimage.jpg"]) {
        NearbyTextCell *textCell = [tableView dequeueReusableCellWithIdentifier:@"NearbyTextCell" forIndexPath:indexPath];
        textCell.labelLikeCount.text = [[_arrTableData valueForKey:@"like_count"] objectAtIndex:indexPath.row];
        textCell.labelUsername.text = [[_arrTableData valueForKey:@"username"]objectAtIndex:indexPath.row];
        textCell.labelPost.text = [[_arrTableData valueForKey:@"time_since"]objectAtIndex:indexPath.row];
        textCell.labelPost.text = [[_arrTableData valueForKey:@"text"]objectAtIndex:indexPath.row];
        return textCell;
    }
    else{
        NearbyCell* cell = [tableView dequeueReusableCellWithIdentifier:@"NearbyCell" forIndexPath:indexPath];
        cell.labelCountLikes.text = [[_arrTableData valueForKey:@"like_count"] objectAtIndex:indexPath.row];
        cell.labelUsername.text = [[_arrTableData valueForKey:@"username"]objectAtIndex:indexPath.row];
        cell.labelTime.text = [[_arrTableData valueForKey:@"time_since"]objectAtIndex:indexPath.row];
        cell.labelPost.text = [[_arrTableData valueForKey:@"text"]objectAtIndex:indexPath.row];
        
        NSString *imageLink = [[_arrTableData valueForKey:@"image"]objectAtIndex:indexPath.row];
        NSString *image = [NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/resize/%@",imageLink];
        NSURL *url = [NSURL URLWithString:image];
        [cell.imgUserPic sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"6.jpg"]];
        return  cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[[_arrTableData valueForKey:@"image" ]objectAtIndex:indexPath.row] isEqual:@""]||[[[_arrTableData valueForKey:@"image"]objectAtIndex:indexPath.row ] isEqual:@"noimage.jpg"]){
        CGSize textSize = [[[_arrTableData objectAtIndex:indexPath.row] valueForKey:@"text"] sizeWithFont:[UIFont systemFontOfSize:30] constrainedToSize:CGSizeMake(1000, 1000) lineBreakMode: NSLineBreakByWordWrapping];
        return textSize.height + 80 ;
    }
    else {
    
        CGSize textSize = [[[_arrTableData objectAtIndex:indexPath.row] valueForKey:@"text"] sizeWithFont:[UIFont systemFontOfSize:35.f] constrainedToSize:CGSizeMake(1000, 1000) lineBreakMode: NSLineBreakByWordWrapping];
        return textSize.height + 80 ;
    }

}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        _currentLat = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        _currentLng = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}


@end
