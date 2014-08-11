//
//  BlureViewController.h
//  DuiZhun
//
//  Created by 魔时网 on 14-8-9.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseNavigationController.h"
#import "FXBlurView.h"

@interface BlureViewController : BaseNavigationController
//@property (weak, nonatomic) IBOutlet FXBlurView *blurView;

@property (strong, nonatomic) FXBlurView *blurView;

@end
