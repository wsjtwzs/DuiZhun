//
//  CameraViewController.h
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraViewController : BaseViewController

//公用view
@property (nonatomic,strong) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *light;
@property (weak, nonatomic) IBOutlet UIButton *frot;
@property (weak, nonatomic) IBOutlet UIView *captureView;


//拍照view
@property (retain, nonatomic) IBOutlet UIView *bg;
@property (nonatomic,strong) IBOutlet UIButton *heart;
@property (nonatomic,strong) IBOutlet UIButton *shotScreenBtn;
@property (nonatomic,strong) IBOutlet UIButton *recordBtn;

//录像view
@property (retain, nonatomic) IBOutlet UIView *video_bg;
@property (weak, nonatomic) IBOutlet UIButton *refesh;
@property (weak, nonatomic) IBOutlet UIButton *record;



//公用button
- (IBAction)turnToPhoto:(id)sender;
- (IBAction)recordFront:(id)sender;
- (IBAction)back:(id)sender;

//牌照方法
- (IBAction)takePhoto:(id)sender;
- (IBAction)heartPress:(id)sender;


//录像方法
- (IBAction)recordVideo:(id)sender;
- (IBAction)refresh:(id)sender;
- (IBAction)nextStep:(id)sender;



//
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) AVCaptureDeviceInput *inputDevice;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, strong) AVCaptureConnection *myVideoConnection;
@property (nonatomic, assign) BOOL videoMode;

@end
