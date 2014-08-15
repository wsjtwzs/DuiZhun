//
//  GuideViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransitionViewController.h"

@interface GuideViewController :TransitionViewController

@property (weak, nonatomic) IBOutlet UIButton *camButton;

- (IBAction)search:(id)sender;
- (IBAction)openCam:(id)sender;

@end
