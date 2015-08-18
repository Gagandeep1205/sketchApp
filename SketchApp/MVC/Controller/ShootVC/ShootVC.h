//
//  ShootVC.h
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TimeLIne.h"

@interface ShootVC : UIViewController <UIImagePickerControllerDelegate, UIAlertViewDelegate, UITabBarDelegate,UINavigationControllerDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITabBar *tabBarPost;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) NSTimeInterval videoMaximumDuration;
@property (strong, nonatomic) AVCaptureDevice * device;
@property (strong, nonatomic) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureDeviceInput *deviceInput;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;
@property (strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput;
@property (strong, nonatomic) AVCaptureConnection *videoConnection;
@property (weak, nonatomic) IBOutlet UIButton *btnSwapCamera;
@property (weak, nonatomic) IBOutlet UIButton *btnCapture;
@property (weak, nonatomic) IBOutlet UIButton *btnFlash;
@property (weak, nonatomic) IBOutlet UIView *activityBar;
@property (weak, nonatomic) IBOutlet UITextView *textViewCaption;

- (IBAction)actionBtnBack:(id)sender;
- (IBAction)actionBtnFlash:(id)sender;
- (IBAction)actionBtnCapture:(id)sender;
- (IBAction)actionBtnSwapCamera:(id)sender;
- (IBAction)actionBtnPost:(id)sender;
@end