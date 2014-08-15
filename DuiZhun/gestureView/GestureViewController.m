//
//  GestureViewController.m
//  DuiZhun
//
//  Created by 魔时网 on 14-8-7.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GestureViewController.h"
#import "AppDelegate.h"
#import "BlureViewController.h"

@interface GestureViewController ()

@end

@implementation GestureViewController

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

    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:ges];

    
    //继承于Basetableview 会默认增加一个tableView，如果不移除，所有xib上内容无法点击
    [self.baseTableView removeFromSuperview];

}

//- (void) pan:(UIPanGestureRecognizer *)rec
//{
//    if ([self.delegate respondsToSelector:@selector(panGesture:)]) {
//        [self.delegate panGesture:rec];
//    }
//    
//    CGPoint coordinate_start;
//    if (rec.state == UIGestureRecognizerStateBegan) {
//        coordinate_start = [rec translationInView:self.view];
//    }
//    else if (rec.state == UIGestureRecognizerStateEnded) {
//        CGPoint coordinate_end = [rec translationInView:self.view];
//        if (coordinate_end.x < -50) {
//            [NOTIFICATIONCENTER  postNotificationName:NOTI_GESTURE_RIGHT object:rec];
//        }
//    }
//}

- (void) pan:(UIPanGestureRecognizer *)rec
{
    [NOTIFICATIONCENTER  postNotificationName:NOTI_GESTURE_LEFT object:rec];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{}

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
