//
//  GestureViewController.h
//  DuiZhun
//
//  Created by 魔时网 on 14-8-7.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseTableViewController.h"
@protocol GestureViewControllerDelegate;

@interface GestureViewController : BaseTableViewController
@property (nonatomic, assign) id<GestureViewControllerDelegate> delegate;
@end

@protocol GestureViewControllerDelegate <NSObject>

- (void) panGesture:(UIPanGestureRecognizer *)ges;

@end
