//
//  LoginViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "LoginViewController.h"
#import "IonIcons.h"

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
    [self changeImageColor];
    self.scrollView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame)+1);
    
        _keyboardScrollView = self.scrollView;
    //给图标设置图片
    self.user_icon.image = [IonIcons imageWithIcon:icon_ios7_person iconColor:[UIColor grayColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
    self.pass_icon.image = [IonIcons imageWithIcon:icon_ios7_unlocked iconColor:[UIColor grayColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
    //设置textfiled的字颜色
    self.user_field.textColor = [UIColor whiteColor];
    self.pass_field.textColor = [UIColor whiteColor];
//    self.user_field.
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_"]];
    
}

- (void) changeImageColor
{
    
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:WHITECOLOR] forState:UIControlStateNormal];
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
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
    [self letsgoWithUsername:self.user_field.text password:self.pass_field.text];
}

- (IBAction)navBack:(id)sender {
        [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)user_start:(id)sender {

    [self changeUser];
}

- (IBAction)user_end:(id)sender {
    [self done];
    
}

- (IBAction)pass_start:(id)sender {
    [self changePass];
}

- (IBAction)pass_end:(id)sender {
    [self done];
}

-(void) changeUser {
    self.user_icon.image = [IonIcons imageWithIcon:icon_ios7_person iconColor:[UIColor yellowColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
    self.pass_icon.image = [IonIcons imageWithIcon:icon_ios7_unlocked iconColor:[UIColor grayColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
}

-(void) changePass {
    self.user_icon.image = [IonIcons imageWithIcon:icon_ios7_person iconColor:[UIColor grayColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
    self.pass_icon.image = [IonIcons imageWithIcon:icon_ios7_unlocked iconColor:[UIColor yellowColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
}


-(void) done {
    self.user_icon.image = [IonIcons imageWithIcon:icon_ios7_person iconColor:[UIColor grayColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
    self.pass_icon.image = [IonIcons imageWithIcon:icon_ios7_unlocked iconColor:[UIColor grayColor]
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];
}

@end
