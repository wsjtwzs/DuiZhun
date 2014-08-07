//
//  NavView.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@interface NavView : FXBlurView

//单例
+ (NavView *) shareNavView;
//@property (weak, nonatomic) IBOutlet FXBlurView *blureView;

- (IBAction)buttonPressed:(id)sender;

@end
