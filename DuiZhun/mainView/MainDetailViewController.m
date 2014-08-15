//
//  MainDetailViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-13.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MainDetailViewController.h"
#import <Frontia/Frontia.h>
#import "ShareMethod.h"

typedef enum{
    buttonPressed_heart     = 401,
    buttonPressed_share     = 402,
} buttonPressed;
@interface MainDetailViewController ()

@end

@implementation MainDetailViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    switch (sender.tag) {
        case buttonPressed_heart:
            self.heartButton.backgroundColor = [UIColor yellowColor];
            self.shareButton.backgroundColor = BLACKCOLOR;
            break;
        case buttonPressed_share:
            self.shareButton.backgroundColor = [UIColor yellowColor];
            self.heartButton.backgroundColor = BLACKCOLOR;
            [self share];
            break;
        default:
            break;
    }
}


- (void) share
{
    FrontiaShareContent *content=[[FrontiaShareContent alloc] init];
    content.url = @"baidu.com";
    content.title = @"baidu";
    content.description = @"share";
    content.imageObj = self.imageView.image;
    
    [ShareMethod shareWithContent:content];
}
@end
