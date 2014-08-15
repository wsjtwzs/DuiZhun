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
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_"]];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) changeImageColor
{
    
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:WHITECOLOR] forState:UIControlStateNormal];
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
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
