//
//  BaseNavigationController.h
//  modelTest
//
//  Created by 魔时网 on 13-10-31.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalConfig.h"

#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]
#define kkBackViewHeight [UIScreen mainScreen].bounds.size.height
#define kkBackViewWidth [UIScreen mainScreen].bounds.size.width

#define iOS7  ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

// 背景视图起始frame.x
#define startX -200;

@interface GestureNavigationController : UINavigationController<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
{
    CGFloat startBackViewX;
}

// 默认为特效开启
@property (nonatomic, assign) BOOL canDragBack;
@property(nonatomic,weak) UIViewController* currentShowVC;

@end
