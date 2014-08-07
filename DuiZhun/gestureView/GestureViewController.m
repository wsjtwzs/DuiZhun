//
//  GestureViewController.m
//  DuiZhun
//
//  Created by 魔时网 on 14-8-7.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GestureViewController.h"
#import "AppDelegate.h"

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

}

- (void) pan:(UIPanGestureRecognizer *)rec
{
    CGPoint coordinate_start;
    if (rec.state == UIGestureRecognizerStateBegan) {
        coordinate_start = [rec translationInView:self.view];
    }
    else if (rec.state == UIGestureRecognizerStateEnded) {
        CGPoint coordinate_end = [rec translationInView:self.view];
        if (coordinate_end.x < -50) {
        AppDelegate *del = [UIApplication sharedApplication].delegate;
        del.navView.hidden = NO;
        [del.window bringSubviewToFront:del.navView];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
