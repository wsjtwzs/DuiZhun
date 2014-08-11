//
//  WindowRootViewController.h
//  DuiZhun
//
//  Created by 魔时网 on 14-8-9.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "BlureViewController.h"
#import "WSTabBarController.h"
#import "FXBlurView.h"

@interface WindowRootViewController : BaseViewController

@property (strong, nonatomic) WSTabBarController  *tabCtl;
@property (strong, nonatomic) BlureViewController *navCtl;


@property (nonatomic, strong) FXBlurView *blurView;

@end
