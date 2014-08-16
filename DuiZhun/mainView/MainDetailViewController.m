//
//  MainDetailViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-13.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MainDetailViewController.h"
#import <Frontia/Frontia.h>
#import "ShareMethod.h"
#import <CoreGraphics/CoreGraphics.h>
typedef enum{
    buttonPressed_heart     = 401,
    buttonPressed_share     = 402,
} buttonPressed;


#define rect_hidden CGRectMake(0, SCREENHEIGHT, 320, 190);
#define rect_show CGRectMake(0, SCREENHEIGHT - 190, 320, 190);
@interface MainDetailViewController ()
{
    BOOL _selectHeart;
}

@end

@implementation MainDetailViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_"]];
    
    [self.leftLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yello"]]];
    [self.rightLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"yello"]]];
    
    
    [self changeImageColor];
    [self.heartButton setBackgroundImage:[self createImageWithColor:CLEARCOLOR] forState:UIControlStateNormal];
    
    [self.heartButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:WHITECOLOR iconSize:25 imageSize:CGSizeMake(120, 60)] forState:UIControlStateNormal];
    [self.heartButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:BLACKCOLOR iconSize:25 imageSize:CGSizeMake(120, 60)] forState:UIControlStateHighlighted];
//    [self.heartButton setBackgroundImage:[UIImage imageNamed:@"yello"] forState:UIControlStateHighlighted];

    [self.shareButton setImage:[IonIcons imageWithIcon:icon_share iconColor:WHITECOLOR iconSize:27 imageSize:CGSizeMake(120, 60)] forState:UIControlStateNormal];
    [self.shareButton setImage:[IonIcons imageWithIcon:icon_share iconColor:BLACKCOLOR iconSize:27 imageSize:CGSizeMake(120, 60)] forState:UIControlStateHighlighted];
//    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"yello"] forState:UIControlStateHighlighted];
    shareView.frame = rect_hidden;
    [self.view addSubview:shareView];
    
    [self setValueForView];
    
    
}

- (void) setValueForView
{
    self.imageView.image = [UIImage imageNamed:self.model.image];
    self.titleLabel.text = self.model.title;
    self.heartNumber.text = self.model.heart;
    
}

- (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 161, 60);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void) changeImageColor
{
    heartImage.image = [IonIcons imageWithIcon:icon_ios7_heart size:20 color:WHITECOLOR];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(id)sender {
    [UIView animateWithDuration:0.1 animations:^(void){
        self.leftLabel.alpha = 0;
        self.rightLabel.alpha = 0;
    }];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    switch (sender.tag) {
        case buttonPressed_heart:
            _selectHeart = !_selectHeart;
            self.leftLabel.alpha = 0.6;
            [self.heartButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:_selectHeart?YELLOWCOLOR:WHITECOLOR iconSize:25 imageSize:CGSizeMake(120, 60)] forState:UIControlStateNormal];

            
            if (_selectHeart) {
                self.heartNumber.text = [NSString stringWithFormat:@"%d",[self.heartNumber.text integerValue] + 1];
            }
            else {
                self.heartNumber.text = [NSString stringWithFormat:@"%d",[self.heartNumber.text integerValue] - 1];
            }
            break;
        case buttonPressed_share:
//            [self share];
            self.rightLabel.alpha = 0.6;
            [self shareViewHidden:NO];

            break;
        default:
            break;
    }
    [self changeColor:nil];
}

- (IBAction)shareCancle:(id)sender {
    [self shareViewHidden:YES];
}

- (IBAction)shareTotengxun:(id)sender {
}

- (IBAction)shareTowechat:(id)sender {
}

- (IBAction)shareToSina:(id)sender {
}

- (IBAction)openCam:(id)sender {
        [self.navigationController pushViewController:[Controllers viewControllerWithName:@"CameraViewController"] animated:YES];
}

- (IBAction)IBActionopenCamidsenderselfnavigationControllerpushViewControllerControllersviewControllerWithNameCameraViewControlleranimatedYESopenCam:(id)sender {
}

- (void) shareViewHidden:(BOOL)hidden
{
    [UIView animateWithDuration:0.2 animations:^{
        if (hidden) {
            shareView.frame = rect_hidden;
        }
        else {
            shareView.frame = rect_show;
        }
    }];
}


- (void) share
{
    FrontiaShareContent *content=[[FrontiaShareContent alloc] init];
    content.url = @"baidu.com";
    content.title = @"baidu";
    content.description = @"share";
    content.imageObj = self.imageView.image;
    
    [ShareMethod shareWithContent:content];
}
@end
