//
//  ConfigViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "ConfigViewController.h"

typedef enum{
    buttonPressed_binding   = 301,
    buttonPressed_info      = 302,
    buttonPressed_suggess   = 303,
    buttonPressed_clean     = 304,
} buttonPressed;

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)close:(id)sender {
    [super close:sender];
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case buttonPressed_binding:
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"BIndingViewController"]];
            break;
        case buttonPressed_info:
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"APPInfoViewController"]];
            break;
        case buttonPressed_suggess:
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"SuggessViewController"]];
            break;
        case buttonPressed_clean:
            [GlobalConfig alert:@"缓存清楚成功"];
            break;

        default:
            break;
    }
}

@end
