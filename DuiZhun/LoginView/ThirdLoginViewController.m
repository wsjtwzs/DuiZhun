//
//  ThirdLoginViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ThirdLoginViewController.h"

typedef enum {
    buttonPressed_sina      =201,
    buttonPressed_tengxun   =202,
    buttonPressed_login     =203,

}buttonPressed;

@interface ThirdLoginViewController ()

@end

@implementation ThirdLoginViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case buttonPressed_sina:
            
            break;
        case buttonPressed_tengxun:
            
            break;
        case buttonPressed_login:
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"LoginViewController"] animated:YES];
            break;
            
        default:
            break;
    }
}
@end
