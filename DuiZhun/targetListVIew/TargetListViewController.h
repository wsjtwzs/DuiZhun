//
//  TargetListViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GestureViewController.h"

@interface TargetListViewController : GestureViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIButton *cameraButton;
- (IBAction)showMenu:(id)sender;
- (IBAction)openCam:(id)sender;

@end
