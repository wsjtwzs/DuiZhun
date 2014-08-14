//
//  ConfigViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ConfigViewController.h"
#import "AppDelegate.h"
#import "IonIcons.h"

typedef enum{
    buttonPressed_binding   = 301,
    buttonPressed_info      = 302,
    buttonPressed_suggess   = 303,
    buttonPressed_clean     = 304,
} buttonPressed;

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) changeImageColor
{
    NSArray *iconArray = @[configImage,bindingImage,wifiImage,notiImage,infoImage,suggessImage,cleanImage];
    NSArray *iconName = @[icon_settings,icon_log_in, icon_wifi,icon_ios7_bell, icon_android_information,icon_chatbox_working,icon_trash_a];
    for (UIImageView *imageView in iconArray) {
        imageView.image = [IonIcons imageWithIcon:iconName[[iconArray indexOfObject:imageView]] size:20 color:WHITECOLOR];
    }
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:WHITECOLOR] forState:UIControlStateNormal];
        [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
}


- (IBAction)exit:(id)sender {
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    
    [UIView animateWithDuration:0.2 animations:^{
        del.window.alpha = 0;
    } completion:^(BOOL finish) {
    [GlobalConfig saveUserDefaultWithDictionary:@{USER_USERID:@NO}];
        del.window.rootViewController = [Controllers firstViewController];
        [UIView animateWithDuration:0.2 animations:^{
            del.window.alpha = 1;
        }];
    }];

}

- (IBAction)close:(id)sender {
    [super close:sender];
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case buttonPressed_binding:
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"BIndingViewController"]];
            break;
        case buttonPressed_info:
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"APPInfoViewController"]];
            break;
        case buttonPressed_suggess:
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"SuggessViewController"]];
            break;
        case buttonPressed_clean:
            [GlobalConfig alert:@"缓存清楚成功"];
            break;

        default:
            break;
    }
}

@end
