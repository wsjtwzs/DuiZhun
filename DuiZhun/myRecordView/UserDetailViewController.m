//
//  UserDetailViewController.m
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "UserDetailViewController.h"
#import "Ionicons.h"

@interface UserDetailViewController ()

@end
static BOOL hasFav = NO;

@implementation UserDetailViewController

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
    if (!self.image) {
        self.image = [UIImage imageNamed:@"6.jpg"];
    }
    self.detailImage.image = self.image;

    //设置按钮图片
    [self.heart setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor whiteColor]
                                            iconSize:25.0f
                                           imageSize:CGSizeMake(100.0f, 45.0f)] forState:UIControlStateNormal];
    [self.share setImage:[IonIcons imageWithIcon:icon_share iconColor:[UIColor whiteColor]
                                        iconSize:29.0f
                                       imageSize:CGSizeMake(100.0f, 45.0f)] forState:UIControlStateNormal];
    [self.remove setImage:[IonIcons imageWithIcon:icon_trash_a iconColor:[UIColor whiteColor]
                                        iconSize:25.0f
                                       imageSize:CGSizeMake(100.0f, 45.0f)] forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)heartPress:(id)sender {
    if (hasFav) {
        [self.heart setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor whiteColor]
                                            iconSize:25.0f
                                           imageSize:CGSizeMake(100.0f, 45.0f)] forState:UIControlStateNormal];
        hasFav = NO;
    }else{
        [self.heart setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor yellowColor]
                                            iconSize:25.0f
                                           imageSize:CGSizeMake(100.0f, 45.0f)] forState:UIControlStateNormal];
        hasFav = YES;
    }
}

- (IBAction)sharePress:(id)sender {
}

- (IBAction)removePress:(id)sender {
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:nil message:@"确认删除吗" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [a show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end