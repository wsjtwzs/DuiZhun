//
//  WindowRootViewController.m
//  DuiZhun
//
//  Created by 魔时网 on 14-8-9.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "WindowRootViewController.h"
#import "Controllers.h"

@interface WindowRootViewController ()

@end

@implementation WindowRootViewController

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

    [self createTabbarViewController];
    [self createBlurViewController];
    
    [NOTIFICATIONCENTER addObserver:self selector:@selector(showNavController) name:NOTI_GESTURE_RIGHT object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(hiddleNavController) name:NOTI_NAVBUTTON_PRESS object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createTabbarViewController
{
    self.tabCtl = (WSTabBarController *)[Controllers mainTabbarController];
    [self addChildViewController:self.tabCtl];
    [self.view addSubview:self.tabCtl.view];
    self.tabCtl.view.backgroundColor = CLEARCOLOR;
    self.tabCtl.tabBar.hidden = YES;
    
    self.blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    self.blurView.frame = FRAME_RIGHT;
    self.blurView.dynamic = YES;
    self.blurView.blurEnabled = YES;
    self.blurView.blurRadius = 10.0f;
    [self.tabCtl.view addSubview:self.blurView];
}

- (void) createBlurViewController
{
    self.navCtl = [[BlureViewController alloc] initWithRootViewController:[Controllers guideViewController]];
    self.navCtl.view.frame = FRAME_RIGHT;
    self.navCtl.view.hidden = YES;
    [self.navCtl setNavigationBarHidden:YES];
    [self addChildViewController:self.navCtl];
    [self.view addSubview:self.navCtl.view];
}

- (void) showNavController
{
    self.navCtl.view.hidden = NO;
    
    if (CGRectEqualToRect(self.navCtl.view.frame, FRAME_RIGHT)) {
        self.blurView.blurEnabled = YES;
        self.blurView.alpha = 0;
        
        [UIView animateWithDuration:DURATION_NAVVIEW animations:^{
            self.navCtl.view.frame = FRAME_MIDDLE;
            self.blurView.frame = FRAME_MIDDLE;
            self.blurView.alpha = 1;
        } completion:^(BOOL finish) {
            
        }];
//        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
//            self.navCtl.view.frame = FRAME_MIDDLE;
//            self.blurView.frame = FRAME_MIDDLE;
//        } completion:^(BOOL finish){
//        
//        }];
    }

}

- (void) hiddleNavController
{
    if (CGRectEqualToRect(self.navCtl.view.frame,FRAME_MIDDLE)) {
        
        self.blurView.blurEnabled = NO;
        [UIView animateWithDuration:DURATION_NAVVIEW animations:^{
            self.navCtl.view.frame = FRAME_RIGHT;
            self.blurView.frame = FRAME_RIGHT;
        } completion:^(BOOL finish) {
            self.navCtl.view.hidden = YES;
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
