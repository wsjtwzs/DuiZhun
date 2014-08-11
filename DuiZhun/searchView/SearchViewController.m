//
//  SearchViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-11.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "SearchViewController.h"

static CGFloat searchBarHeight = 40;

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    
    self.baseTableView.frame = CGRectOffset(self.baseTableView.frame, 0, searchBarHeight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [super close:sender];
}
@end
