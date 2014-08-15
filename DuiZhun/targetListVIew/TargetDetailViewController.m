//
//  TargetDetailViewController.m
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TargetDetailViewController.h"

@interface TargetDetailViewController ()

@end

@implementation TargetDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:NSStringFromClass([MainDetailViewController  class]) bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setValueForView
{
    self.imageView.image = [UIImage imageNamed:self.targetModel.image];
    self.titleLabel.text = self.targetModel.title;
    self.heartNumber.text = self.targetModel.heart;
    self.contentLabel.text = self.targetModel.subTitle;
}

@end
