//
//  BlureViewController.m
//  DuiZhun
//
//  Created by 魔时网 on 14-8-9.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BlureViewController.h"

@interface BlureViewController ()

@end

@implementation BlureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (id) init
//{
//    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BlureViewController class]) owner:self options:nil] objectAtIndex:0];
//        
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame),CGRectGetHeight(self.view.frame))];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.8;
    [self.view insertSubview:view atIndex:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
