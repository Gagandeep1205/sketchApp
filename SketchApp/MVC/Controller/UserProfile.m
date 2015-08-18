//
//  UserProfile.m
//  SketchApp
//
//  Created by Kunal Gupta on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "UserProfile.h"

@interface UserProfile ()

@end

@implementation UserProfile

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUI];
}
-(void)initializeUI{
//    self.layer.backgroundColor=[[UIColor clearColor] CGColor];
//    imageView.layer.cornerRadius=20;
//    imageView.layer.borderWidth=2.0;
//    imageView.layer.masksToBounds = YES;
//    imageView.layer.borderColor=[[UIColor redColor] CGColor];
    
}

#pragma mark - table view delegates

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 300;
    }
    return 170;
}
  
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProfilePicCell *cellProfile = [tableView dequeueReusableCellWithIdentifier:@"cellProfile"];
    PostCell *cellPost = [tableView dequeueReusableCellWithIdentifier:@"cellPost"];
    if(indexPath.row == 0){
        return cellProfile;
    }
        cellPost.imageViewPostPIc.layer.backgroundColor=[[UIColor clearColor] CGColor];
        cellPost.imageViewPostPIc.layer.cornerRadius=35;
        cellPost.imageViewPostPIc.layer.borderWidth=2.0;
        cellPost.imageViewPostPIc.layer.masksToBounds = YES;
        cellPost.imageViewPostPIc.layer.borderColor=[[UIColor blackColor] CGColor];
    return cellPost;
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (IBAction)actionBtnSettings:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Options *VC = [storyBoard instantiateViewControllerWithIdentifier:@"Options"];
    [self.navigationController pushViewController:VC animated:true];
}

- (IBAction)actionBtnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}
@end
