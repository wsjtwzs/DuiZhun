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

    self.view.backgroundColor = BLACKCOLOR;
    
    [self createTabbarViewController];
    [self createBlurViewController];
    
    [NOTIFICATIONCENTER addObserver:self selector:@selector(hiddleNavController:) name:NOTI_GESTURE_RIGHT object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(showNavController:) name:NOTI_GESTURE_LEFT object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(hiddleNavController:) name:NOTI_NAVBUTTON_PRESS object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createTabbarViewController
{
    self.tabCtl = (WSTabBarController *)[Controllers mainTabbarController];
    self.tabCtl.view.frame = CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT);
    [self addChildViewController:self.tabCtl];
    [self.view addSubview:self.tabCtl.view];
    self.tabCtl.view.backgroundColor = CLEARCOLOR;
    self.tabCtl.tabBar.hidden = YES;
    
    self.blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
//    self.blurView.frame = FRAME_RIGHT;
    self.blurView.dynamic = YES;
    self.blurView.blurEnabled = NO;
    self.blurView.blurRadius = 10.0f;
    self.blurView.alpha = 0;
    [self.tabCtl.view addSubview:self.blurView];
}

- (void) createBlurViewController
{
    self.navCtl = [[BlureViewController alloc] initWithRootViewController:[Controllers guideViewController]];
    self.navCtl.view.frame = FRAME_RIGHT;
//    self.navCtl.view.hidden = YES;
    [self.navCtl setNavigationBarHidden:YES];
    [self addChildViewController:self.navCtl];
    [self.view addSubview:self.navCtl.view];
}

//- (void) showNavController
//{
//    self.navCtl.view.hidden = NO;
//    
//    if (CGRectEqualToRect(self.navCtl.view.frame, FRAME_RIGHT)) {
//        self.blurView.blurEnabled = YES;
//        self.blurView.alpha = 0;
//        
//        [UIView animateWithDuration:DURATION_NAVVIEW animations:^{
//            self.navCtl.view.frame = FRAME_MIDDLE;
//            self.blurView.frame = FRAME_MIDDLE;
//            self.blurView.alpha = 1;
//        } completion:^(BOOL finish) {
//            
//        }];
////        [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
////            self.navCtl.view.frame = FRAME_MIDDLE;
////            self.blurView.frame = FRAME_MIDDLE;
////        } completion:^(BOOL finish){
////        
////        }];
//    }
//
//}

//userGesture
- (void) showNavController:(NSNotification *)noti
{
    if (!(noti.object)) {
        [self animation:FRAME_MIDDLE];
    }
    else {
        UIPanGestureRecognizer *rec = noti.object;
        
        static CGPoint coordinate_start;
        CGPoint coordinate_change = [rec translationInView:self.view];
        if (rec.state == UIGestureRecognizerStateBegan) {
            coordinate_start = [rec translationInView:self.view];
        }
        else if (rec.state == UIGestureRecognizerStateChanged) {
            if (coordinate_change.x < 0) {
                self.navCtl.view.frame = CGRectOffset(self.navCtl.view.frame, coordinate_change.x - coordinate_start.x, 0);
//                self.blurView.frame = CGRectOffset(self.blurView.frame, coordinate_change.x - coordinate_start.x, 0);;
//                if (coordinate_change.x < -(320-100)) {
//                    if (coordinate_change.x < coordinate_start.x) {
//                    
//                        [UIView animateWithDuration:0.2 animations:^{
//                            self.blurView.blurEnabled = YES;
//                            self.blurView.alpha = 1;
//                        }];
//                    }
//                    else {
//                        [UIView animateWithDuration:0.2 animations:^{
//                            self.blurView.blurEnabled = NO;
//                            self.blurView.alpha = 0;
//                        }];
//                    }
//                }
            }
            coordinate_start = coordinate_change;
        }
        else if (rec.state == UIGestureRecognizerStateEnded) {
            CGPoint coordinate_end = [rec translationInView:self.view];
            if (coordinate_end.x < -100) {
                [self animation:FRAME_MIDDLE];
            }
            else {
                 [self animation:FRAME_RIGHT];
            }
        }
    }
}

- (void) hiddleNavController:(NSNotification *)noti
{
    if (!(noti.object)) {
        [self animation:FRAME_RIGHT];
    }
    else {
        UIPanGestureRecognizer *rec = noti.object;
        
        static CGPoint coordinate_start;
        CGPoint coordinate_change = [rec translationInView:self.view];
        if (rec.state == UIGestureRecognizerStateBegan) {
            coordinate_start = [rec translationInView:self.view];
        }
        else if (rec.state == UIGestureRecognizerStateChanged) {
            if (coordinate_change.x > 0) {
                self.navCtl.view.frame = CGRectOffset(self.navCtl.view.frame, coordinate_change.x - coordinate_start.x, 0);
//                self.blurView.frame = CGRectOffset(self.blurView.frame, coordinate_change.x - coordinate_start.x, 0);;
                
                if (coordinate_change.x > 100) {
                    if (coordinate_change.x < coordinate_start.x) {
                        
//                        [UIView animateWithDuration:0.2 animations:^{
//                            self.blurView.blurEnabled = YES;
//                            self.blurView.alpha = 1;
//                        }];
                    }
                    else {
                        [UIView animateWithDuration:0.2 animations:^{
                            self.blurView.blurEnabled = NO;
                            self.blurView.alpha = 0;
                        }];
                    }
                }

            }
            coordinate_start = coordinate_change;
        }
        else if (rec.state == UIGestureRecognizerStateEnded) {
            CGPoint coordinate_end = [rec translationInView:self.view];
            if (coordinate_end.x > 100) {
                [self animation:FRAME_RIGHT];
            }
            else {
                [self animation:FRAME_MIDDLE];
            }
        }

    }
}

- (void) animation:(CGRect)rect
{
//    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.3 options:0 animations:^{
//        self.navCtl.view.frame = rect;
//        self.blurView.frame = rect;
//    } completion:^(BOOL finish){}];
    
    
        [UIView animateWithDuration:DURATION_NAVVIEW animations:^{
            self.navCtl.view.frame = rect;
//            self.blurView.frame = rect;
            if (CGRectEqualToRect(rect, FRAME_MIDDLE)) {
//                self.blurView.blurEnabled = YES;
//                self.blurView.alpha = 1;
            }
            else {
                self.blurView.blurEnabled = NO;
                self.blurView.alpha = 0;
            }

        } completion:^(BOOL finish) {
            if (CGRectEqualToRect(rect,FRAME_MIDDLE)) {
                self.blurView.blurEnabled = YES;
                [UIView animateWithDuration:0.2 animations:^{
                    self.blurView.alpha = 1;
                } completion:^(BOOL finish) {
                    self.blurView.blurEnabled = NO;
                }];
            }
            else {
                self.blurView.alpha = 0;
                self.blurView.blurEnabled = NO;
            }

        }];

}

//- (void) hiddleNavController:(NSNotification *)noti
//{
//    if (!noti) {
//        [self animation:FRAME_MIDDLE];
//    }
//    else {
//    }
//    if (CGRectEqualToRect(self.navCtl.view.frame,FRAME_MIDDLE)) {
//        
//        self.blurView.blurEnabled = NO;
//        [UIView animateWithDuration:DURATION_NAVVIEW animations:^{
//            self.navCtl.view.frame = FRAME_RIGHT;
//            self.blurView.frame = FRAME_RIGHT;
//        } completion:^(BOOL finish) {
//            self.navCtl.view.hidden = YES;
//        }];
//    }
//}

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
