//
//  OtherUser.m
//  SketchApp
//
//  Created by Kunal Gupta on 12/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "OtherUser.h"

@interface OtherUser ()

@end

@implementation OtherUser

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProfilePicCellOther *cellProfile = [tableView dequeueReusableCellWithIdentifier:@"cellProfile"];
    PostCellOther *cellPost = [tableView dequeueReusableCellWithIdentifier:@"cellPost"];
    if(indexPath.row == 0){
        return cellProfile;
    }
    cellPost.imageViewPostPic.layer.backgroundColor=[[UIColor clearColor] CGColor];
    cellPost.imageViewPostPic.layer.cornerRadius=35;
    cellPost.imageViewPostPic.layer.borderWidth=2.0;
    cellPost.imageViewPostPic.layer.masksToBounds = YES;
    cellPost.imageViewPostPic.layer.borderColor=[[UIColor blackColor] CGColor];
    return cellPost;
    
}


- (IBAction)actionBtnSettings:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    Options *VC = [storyBoard instantiateViewControllerWithIdentifier:@"Options"];
    [self.navigationController pushViewController:VC animated:true];
}
@end
