//
//  ShootVC.m
//  SketchApp
//
//  Created by Gagandeep Kaur  on 11/08/15.
//  Copyright (c) 2015 Kunal Gupta. All rights reserved.
//

#import "ShootVC.h"

@interface ShootVC ()

@end

@implementation ShootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tabBarPost setDelegate:self];
    _tabBarPost.selectedItem.tag = 1;
    [self cameraOn];
    _textViewCaption.hidden = YES;
    _activityBar.hidden = YES;
}

- (void) cameraOn{
    
    _session = [[AVCaptureSession alloc] init];
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    _deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:_device error:nil];
    if ([_session canAddInput:_deviceInput])
        [_session addInput:_deviceInput];
    AVCaptureVideoPreviewLayer *previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    CALayer *rootLayer = [[self view] layer];
    [rootLayer setMasksToBounds:YES];
    [previewLayer setFrame:CGRectMake(-70, 0, rootLayer.bounds.size.height, rootLayer.bounds.size.height)];
    [rootLayer insertSublayer:previewLayer atIndex:0];
    [_session startRunning];
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark camera buttons

- (IBAction)actionBtnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)actionBtnFlash:(id)sender {
    
    if(!_device.torchMode){
        
        if ([_device hasTorch]) {
            [_device lockForConfiguration:nil];
            [_device setTorchMode:AVCaptureTorchModeOn];
            [_device unlockForConfiguration];
        }
    }
    else{
        
        if ([_device hasTorch]) {
            [_device lockForConfiguration:nil];
            [_device setTorchMode:AVCaptureTorchModeOff];
            [_device unlockForConfiguration];
        }
    }
}

- (IBAction)actionBtnCapture:(id)sender {
    
    _videoConnection = nil;

    for (AVCaptureConnection *connection in self.stillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo] ) {
                _videoConnection = connection;
                break;
            }
        }
        if (_videoConnection) { break; }
    }
    
    NSLog(@"about to request a capture from: %@", self.stillImageOutput);
//    __weak typeof(self) weakSelf = self;
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:_videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
        
        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
        UIImage *image = [[UIImage alloc] initWithData:imageData];
        
        self.imageView.image = image;
        NSLog(@"%@", _imageView.image);
        [_session stopRunning];
    }];

    _textViewCaption.hidden = NO;
    _activityBar.hidden = NO;
    
}

- (IBAction)actionBtnSwapCamera:(id)sender {
    NSLog(@"jhgvffdfdfg");
    if (_device.position == AVCaptureDevicePositionBack) {
        for ( _device in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] ) {
            if ( _device.position == AVCaptureDevicePositionFront) {
                
                NSError * error;
                AVCaptureDeviceInput * newDeviceInput = [[AVCaptureDeviceInput alloc]initWithDevice:_device error:&error];
                [_session beginConfiguration];
                for (_deviceInput in [_session inputs]) {
                    [_session removeInput:_deviceInput];
                }
                
                if ([_session canAddInput:newDeviceInput]) {
                    [_session addInput:newDeviceInput];
                }
                [_session commitConfiguration];
                break;
            }
        }
        
    }else  {
        for ( _device in [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo] ) {
            if ( _device.position == AVCaptureDevicePositionBack) {
                
                NSError * error;
                AVCaptureDeviceInput * newDeviceInput = [[AVCaptureDeviceInput alloc]initWithDevice:_device error:&error];
                [_session beginConfiguration];
                for (_deviceInput in [_session inputs]) {
                    [_session removeInput:_deviceInput];
                }
                
                if ([_session canAddInput:newDeviceInput]) {
                    [_session addInput:newDeviceInput];
                }
                [_session commitConfiguration];
                break;
            }
        }
    }
}

- (IBAction)actionBtnPost:(id)sender {
    
    [[[UIAlertView alloc]initWithTitle:@"Are you sure you want to post anonymous?" message:@"No one would ever know you have posted" delegate:self cancelButtonTitle:@"Don't Allow" otherButtonTitles:@"OK", nil]show];}



#pragma mark UIImagePickerDelegates

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    _textViewCaption.hidden = NO;
    _activityBar.hidden = NO;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void) alert{
    [[[UIAlertView alloc]initWithTitle:@"Error" message:@"Cannot find Camera" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil]show];
}


#pragma mark tab bar delegates

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (_tabBarPost.selectedItem.tag == 0){
        [self viewSettings:@"gallery"];
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:NULL];
    
        
    }
    else if (_tabBarPost.selectedItem.tag == 1){
        [self viewSettings:@"camera"];
        [self cameraOn];
        
    }
    else if (_tabBarPost.selectedItem.tag == 2){
        [self cameraOn];
    }
    else if (_tabBarPost.selectedItem.tag == 3){
        
        [self viewSettings:@"text"];
    }
}

- (void) viewSettings: (NSString *)scene{

    if ([scene  isEqual: @"gallery"]) {
        _textViewCaption.hidden = YES;
        _activityBar.hidden = YES;
        _btnCapture.hidden = YES;
        _btnFlash.hidden = YES;
        _btnSwapCamera.hidden = YES;
    }
    else if ([scene isEqual:@"camera"]) {
        _textViewCaption.hidden = YES;
        _activityBar.hidden = YES;
        _btnCapture.hidden = NO;
        _btnFlash.hidden = NO;
        _btnSwapCamera.hidden = NO;
        
    }
    else if ([scene isEqual:@"Video"]) {
        _textViewCaption.hidden = YES;
        _activityBar.hidden = YES;
        _btnCapture.hidden = NO;
        _btnFlash.hidden = NO;
        _btnSwapCamera.hidden = NO;
        
    }
    else if ([scene isEqual:@"text"]) {
        _btnCapture.hidden = YES;
        _btnFlash.hidden = YES;
        _btnSwapCamera.hidden = YES;
        _textViewCaption.hidden = NO;
        _activityBar.hidden = NO;
    }
}

#pragma mark textView delegates

- (void)textViewDidBeginEditing:(UITextView *)textView{

   
    [self.textViewCaption sizeToFit];
    [UIView animateWithDuration:0.3 animations:^{
        _textViewCaption.transform = CGAffineTransformMakeTranslation(0, -210);
        _activityBar.transform = CGAffineTransformMakeTranslation(0, -210);
    }];
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
    CGRect frame = _textViewCaption.frame;
    frame.size.height = _textViewCaption.contentSize.height;
    _textViewCaption.frame = frame;
    _textViewCaption.scrollEnabled = YES;
    [UIView animateWithDuration:0.3 animations:^{
        _textViewCaption.transform = CGAffineTransformMakeTranslation(0, 0);
        _activityBar.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}
@end
