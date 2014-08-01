//
//  NavView.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavView : UIView

//单例
+ (NavView *) shareNavView;

- (IBAction)buttonPressed:(id)sender;

@end
