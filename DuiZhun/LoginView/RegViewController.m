//
//  RegViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "RegViewController.h"

@interface RegViewController ()

@end

@implementation RegViewController

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
    
        _keyboardScrollView = self.scrollView;
        _keyboardScrollView.contentSize = CGSizeMake(CGRectGetWidth(_keyboardScrollView.frame), CGRectGetHeight(_keyboardScrollView.frame)+100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) keyBoardWillHidden:(NSNotification *)noti
{
    //    [GlobalConfig keyBoardDidDisapper:noti scrollView:_keyboardScrollView];
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsZero;
}



- (IBAction)login:(id)sender {
    [GlobalConfig push:NO viewController:nil withNavigationCotroller:self.navigationController animationType:4 subType:2 Duration:DURATION_LOGINVIEW];
}

- (IBAction)letsgo:(id)sender {
    [GlobalConfig saveUserDefaultWithDictionary:@{USER_USERID:@YES}];
    [self.navigationController presentViewController:[Controllers viewControllerWithName:@"WindowRootViewController"] animated:YES completion:^{}];
}

- (IBAction)navBack:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
