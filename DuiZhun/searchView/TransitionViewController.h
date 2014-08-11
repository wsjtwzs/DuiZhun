//
//  TransitionViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-11.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseTableViewController.h"

typedef enum {
    TransitionType_push,
    TransitionType_pop,
} TransitionType;
@interface TransitionViewController : BaseTableViewController

//转场动画
- (void) transitionWithType:(TransitionType)type fromViewController:(UIViewController *)fromCtl toView:(UIViewController *)toCtl;

- (void)close:(id)sender;
@end
