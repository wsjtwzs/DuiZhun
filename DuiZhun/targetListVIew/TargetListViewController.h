//
//  TargetListViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GestureViewController.h"

@interface TargetListViewController : GestureViewController
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
- (IBAction)showMenu:(id)sender;

@end
