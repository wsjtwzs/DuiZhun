//
//  CameraViewController.m
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "CameraViewController.h"
#import "Ionicons.h"
#import "ShareViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.videoMode = NO;
    self.bg.alpha = 1;
    self.video_bg.alpha = 0;
    self.video_bg.hidden = YES;
    
    //公用button样式
    [self.backBtn setBackgroundImage:[IonIcons imageWithIcon:icon_close_round size:29 color:WHITECOLOR] forState:UIControlStateNormal];
    [self.backBtn setBackgroundImage:[IonIcons imageWithIcon:icon_close_round size:29 color:YELLOWCOLOR] forState:UIControlStateHighlighted];

    [self.light setBackgroundImage:[IonIcons imageWithIcon:icon_flash_off size:29 color:WHITECOLOR] forState:UIControlStateNormal];
    [self.light setBackgroundImage:[IonIcons imageWithIcon:icon_flash_off size:29 color:YELLOWCOLOR] forState:UIControlStateHighlighted];

    [self.frot setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_reverse_camera_outline size:29 color:WHITECOLOR] forState:UIControlStateNormal];
    [self.frot setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_reverse_camera_outline size:29 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
    
    //拍照view图标
    [self.heart setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_heart_outline size:30 color:WHITECOLOR] forState:UIControlStateNormal];
    [self.heart setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_heart_outline size:30 color:YELLOWCOLOR] forState:UIControlStateHighlighted];

    [self.recordBtn setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_videocam_outline size:40 color:WHITECOLOR] forState:UIControlStateNormal];
    [self.recordBtn setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_videocam_outline size:40 color:YELLOWCOLOR] forState:UIControlStateHighlighted];

    [self.shotScreenBtn setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_camera_outline size:40 color:YELLOWCOLOR] forState:UIControlStateNormal];
    [self.shotScreenBtn setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_camera_outline size:40 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
    
    //录像view图标
    [self.record setBackgroundColor:[UIColor yellowColor]];
    self.record.layer.cornerRadius = 27;
//    self.record.layer.borderWidth = 2;
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
//    [self.record.layer setBorderColor:colorref];//边框颜色
    
    self.record.clipsToBounds = YES;
    [self.refesh setImage:[IonIcons imageWithIcon:icon_ios7_refresh iconColor:[UIColor whiteColor]
                                            iconSize:39.0f
                                           imageSize:CGSizeMake(39.0f, 39.0f)] forState:UIControlStateNormal];
    
    
    
    //初始化相机
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    [session setSessionPreset:AVCaptureSessionPresetPhoto];
    //查找摄像头
    NSArray *devices = [AVCaptureDevice devices];
    for (AVCaptureDevice *device in devices) {
        if ([device hasMediaType:AVMediaTypeVideo]) {
            if ([device position] == AVCaptureDevicePositionBack) {
                //后面
                AVCaptureDeviceInput *myDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
                [session addInput:myDeviceInput];
            }
        }
    }
    
    //建立 AVCaptureVideoPreviewLayer
    AVCaptureVideoPreviewLayer *myPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    [myPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    myPreviewLayer.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);

    [self.captureView.layer addSublayer:myPreviewLayer];
    [session startRunning];
    
    //建立 AVCaptureStillImageOutput
//    AVCaptureStillImageOutput *myStillImageOutput;
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *myOutputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey,nil];
    [self.stillImageOutput setOutputSettings:myOutputSettings];
    [session addOutput:self.stillImageOutput];
    
    
    //从 AVCaptureStillImageOutput 中取得正确类型的 AVCaptureConnection
//    AVCaptureConnection *myVideoConnection = nil;
    for (AVCaptureConnection *connection in self.stillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                
                self.myVideoConnection = connection;
                break;
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//切换录像拍照模式
- (IBAction)turnToPhoto:(id)sender {
    if (self.videoMode) {
        self.videoMode = NO;
        self.bg.hidden = NO;
        [UIView animateWithDuration:0.6 animations:^{
            self.video_bg.alpha = 0;
            self.bg.alpha = 1;
        } completion:^(BOOL finish){
            self.video_bg.hidden = YES;
        }];
        
    } else {
        self.videoMode = YES;
        self.video_bg.hidden = NO;
        [UIView animateWithDuration:0.6 animations:^{
            self.video_bg.alpha = 1;
            self.bg.alpha = 0;
        } completion:^(BOOL finish){
            self.video_bg.hidden = NO;
            self.bg.hidden = YES;
        }];
        
        ;
    }
    
}

- (IBAction)recordVideo:(id)sender {
    
    
}

- (IBAction)refresh:(id)sender {
}

- (IBAction)recordFront:(id)sender {
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)nextStep:(id)sender {
    //弹出查看结果按钮
}

- (IBAction)takePhoto:(id)sender {
    
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:self.myVideoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        //完成撷取时的处理程序(Block)
        if (imageDataSampleBuffer) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            
            //取得的静态影像
            UIImage *myImage = [[UIImage alloc] initWithData:imageData];
            ShareViewController *vc = (ShareViewController *)[Controllers viewControllerWithName:@"ShareViewController"];
            vc.imageView.image = myImage;
            [self.navigationController pushViewController:vc animated:YES];
//            [self setImage:myImage];
            
            //取得影像数据（需要ImageIO.framework 与 CoreMedia.framework）
//            CFDictionaryRef myAttachments = CMGetAttachment(imageDataSampleBuffer, kCGImagePropertyExifDictionary, NULL);
//            NSLog(@"影像属性: %@", myAttachments);
            
        }
    }];
}

- (IBAction)heartPress:(id)sender {
}
@end
