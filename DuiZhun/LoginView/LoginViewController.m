//
//  LoginViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    
    self.scrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame)+1);
    
        _keyboardScrollView = self.scrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reg:(id)sender {
    [GlobalConfig push:YES viewController:[Controllers viewControllerWithName:@"RegViewController"] withNavigationCotroller:self.navigationController animationType:4 subType:1 Duration:DURATION_LOGINVIEW];
}

- (IBAction)letsgo:(id)sender {
    [GlobalConfig saveUserDefaultWithDictionary:@{USER_USERID:@YES}];
    [self.navigationController presentViewController:[Controllers viewControllerWithName:@"WindowRootViewController"] animated:YES completion:^{}];
}

- (IBAction)navBack:(id)sender {
        [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
