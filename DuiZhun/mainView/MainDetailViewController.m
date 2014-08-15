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

    [self changeImageColor];
//    [self.heartButton setBackgroundImage:[self createImageWithColor:CLEARCOLOR] forState:UIControlStateNormal];
//    [self.heartButton setBackgroundImage:[self createImageWithColor:YELLOWCOLOR] forState:UIControlStateHighlighted];
//    
//    [self.shareButton setBackgroundImage:[self createImageWithColor:CLEARCOLOR] forState:UIControlStateNormal];
//    [self.shareButton setBackgroundImage:[self createImageWithColor:YELLOWCOLOR] forState:UIControlStateHighlighted];
    shareView.frame = rect_hidden;
    [self.view addSubview:shareView];
    
    
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
    heartButtonImae.image = [IonIcons imageWithIcon:icon_ios7_heart size:20 color:WHITECOLOR];
    heartImage.image = [IonIcons imageWithIcon:icon_ios7_heart size:20 color:WHITECOLOR];
    shareImage.image = [IonIcons imageWithIcon:icon_share size:29 color:WHITECOLOR];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    switch (sender.tag) {
        case buttonPressed_heart:
//            self.heartButton.backgroundColor = [UIColor yellowColor];
//            self.shareButton.backgroundColor = BLACKCOLOR;
            _selectHeart = !_selectHeart;
            heartButtonImae.image = [IonIcons imageWithIcon:icon_ios7_heart size:20 color:_selectHeart?YELLOWCOLOR:WHITECOLOR];
            if (_selectHeart) {
                self.heartNumber.text = [NSString stringWithFormat:@"%d",[self.heartNumber.text integerValue] + 1];
            }
            else {
                self.heartNumber.text = [NSString stringWithFormat:@"%d",[self.heartNumber.text integerValue] - 1];
            }
            break;
        case buttonPressed_share:
//            self.shareButton.backgroundColor = [UIColor yellowColor];
//            self.heartButton.backgroundColor = BLACKCOLOR;
//            [self share];
            [self shareViewHidden:NO];
            break;
        default:
            break;
    }
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
