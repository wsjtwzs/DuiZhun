//
//  TransitionViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-11.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@end

@implementation TransitionViewController

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
    
    //继承于Basetableview 会默认增加一个tableView，如果不移除，所有xib上内容无法点击
    [self.baseTableView removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) transitionWithType:(TransitionType)type fromViewController:(UIViewController *)fromCtl toView:(UIViewController *)toCtl
{
    switch (type) {
        case TransitionType_push:
        {
            [UIView animateWithDuration:0.3 animations:^{
                //                self.view.hidden = YES;
                self.view.alpha = 0;
            } completion:^(BOOL finish) {
                [self.navigationController pushViewController:toCtl animated:NO];
            }];
        }
            break;
         case TransitionType_pop:
        {
            [UIView animateWithDuration:0.3 animations:^{
                self.view.alpha = 0;
            } completion:^(BOOL finish) {
                [self.navigationController popViewControllerAnimated:NO];
            }];

        }
            break;
        default:
            break;
    }
}

- (void)close:(id)sender {
    [self transitionWithType:TransitionType_pop fromViewController:self toView:nil];
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
