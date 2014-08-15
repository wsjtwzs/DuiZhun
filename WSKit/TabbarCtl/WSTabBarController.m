//
//  WSTabBarController.m
//  CoolProject
//
//  Created by 魔时网 on 14-6-3.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "WSTabBarController.h"
#import "GlobalConfig.h"

@interface WSTabBarController ()
{
    NSArray *_CtlArray;
}
@end

@implementation WSTabBarController

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

        [NOTIFICATIONCENTER addObserver:self selector:@selector(changeSelectedIndex:) name:NOTI_MAIN object:nil];
        [NOTIFICATIONCENTER addObserver:self selector:@selector(changeSelectedIndex:) name:NOTI_TARGER object:nil];
        [NOTIFICATIONCENTER addObserver:self selector:@selector(changeSelectedIndex:) name:NOTI_USER object:nil];
        [NOTIFICATIONCENTER addObserver:self selector:@selector(changeSelectedIndex:) name:NOTI_CONFIG object:nil];
    
}

- (void) setViewControllers:(NSArray *)array
{
    _CtlArray = array;
//    for (UIViewController *ctl in array) {
//        [self addChildViewController:ctl];
//        [self.view addSubview:ctl.view];
//    }
    [self selectIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) selectIndex:(NSInteger)index
{
    for (UIViewController *ctl in _CtlArray) {
        if ([_CtlArray indexOfObject:ctl] == index) {
            ctl.view.hidden = NO;
            [self.view addSubview:ctl.view];
            [self addChildViewController:ctl];
        }
        else {
            ctl.view.hidden = YES;
            [ctl.view removeFromSuperview];
            [ctl removeFromParentViewController];
        }
    }
}

- (void) changeSelectedIndex:(NSNotification *)noti
{
    
    if ([noti.name isEqualToString:NOTI_MAIN]) {
//        self.selectedIndex = 0;
        [self selectIndex:0];
    }
    else if ([noti.name isEqualToString:NOTI_TARGER]) {
//        self.selectedIndex = 1;
                [self selectIndex:1];
    }
    else if ([noti.name isEqualToString:NOTI_USER]) {
//        self.selectedIndex = 2;
                [self selectIndex:2];
    }
    else if ([noti.name isEqualToString:NOTI_CONFIG]) {
//        self.selectedIndex = 3;
                [self selectIndex:3];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{}


@end
