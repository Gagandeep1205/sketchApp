//
//  Following.m
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "Following.h"

@interface Following ()

@end

@implementation Following

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _uesrAccessToken = [[NSUserDefaults standardUserDefaults] valueForKey:UD_Token];
    [self getFeed:_uesrAccessToken];
    _arrTableData = [[NSMutableArray alloc]init];
}

- (void)viewDidAppear:(BOOL)animated {
    [_tableView triggerPullToRefresh];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    _uesrAccessToken = [[NSUserDefaults standardUserDefaults] valueForKey:UD_Token];
   
    [self.tableView addPullToRefreshWithActionHandler:^{
        
        _pageNo = 1;
        _pageSize = 10;
        [self getFeed:_uesrAccessToken];
    
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        
        _pageNo ++;
        [self getFeed:_uesrAccessToken];

    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void) getFeed : (NSString *)accessToken{

    //[self loadingIndicator];
    _feedParams = [[NSMutableDictionary alloc]init];
    _dicValuePageNo = [NSString stringWithFormat:@"%d", _pageNo];
    _dicValuePageSize = [NSString stringWithFormat: @"%d", _pageSize];
    [_feedParams setObject:accessToken forKey:@"access_token"];
    [_feedParams setObject:_dicValuePageNo forKey:@"page_no"];
    [_feedParams setObject:_dicValuePageSize forKey:@"page_size"];
    
    FeedModal *feed = [[FeedModal alloc]init];
    [feed followingFeed:_feedParams :^(NSDictionary *response_success) {
        
        _arrFeedResponse = [response_success valueForKey:@"data"];
        [_arrTableData arrayByAddingObjectsFromArray:_arrFeedResponse];
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
        followingCell2 *textCell = [tableView dequeueReusableCellWithIdentifier:@"followingCell2"];
        textCell.labelLikeCount.text = [[_arrTableData valueForKey:@"like_count"] objectAtIndex:indexPath.row];
        textCell.labelUsername.text = [[_arrTableData valueForKey:@"username"]objectAtIndex:indexPath.row];
        textCell.labelPost.text = [[_arrTableData valueForKey:@"time_since"]objectAtIndex:indexPath.row];
        textCell.labelPost.text = [[_arrTableData valueForKey:@"text"]objectAtIndex:indexPath.row];
        return textCell;
    }
    else{
        FollowingCell* cell = [tableView dequeueReusableCellWithIdentifier:@"FollowingCell"];
    
        cell.labelLikesCount.text = [[_arrTableData valueForKey:@"like_count"] objectAtIndex:indexPath.row];
        cell.labelUsername.text = [[_arrTableData valueForKey:@"username"]objectAtIndex:indexPath.row];
        cell.labelPostTime.text = [[_arrTableData valueForKey:@"time_since"]objectAtIndex:indexPath.row];
        cell.labelPost.text = [[_arrTableData valueForKey:@"text"]objectAtIndex:indexPath.row];
        NSString *imageLink = [[_arrTableData valueForKey:@"image"]objectAtIndex:indexPath.row];
        NSString *image = [NSString stringWithFormat:@"http://code-brew.com/projects/sketch_lar/public/resize/%@",imageLink];
        NSURL *url = [NSURL URLWithString:image];
        [cell.imgUserPic sd_setImageWithURL:url];
        return  cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[_arrTableData valueForKey:@"image" ]objectAtIndex:indexPath.row] isEqual:@""]||[[[_arrTableData valueForKey:@"image"]objectAtIndex:indexPath.row ] isEqual:@"noimage.jpg"]){
        CGSize textSize = [[[_arrTableData objectAtIndex:indexPath.row] valueForKey:@"text"] sizeWithFont:[UIFont systemFontOfSize:30] constrainedToSize:CGSizeMake(1000, 1000) lineBreakMode: NSLineBreakByWordWrapping];
        return textSize.height + 80;
    }
    else{
    
        CGSize textSize = [[[_arrTableData objectAtIndex:indexPath.row] valueForKey:@"text"] sizeWithFont:[UIFont systemFontOfSize:35.f] constrainedToSize:CGSizeMake(1000, 1000) lineBreakMode: NSLineBreakByWordWrapping];
        return textSize.height + 80 ;
    }

}


@end
