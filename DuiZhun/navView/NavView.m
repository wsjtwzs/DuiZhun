//
//  NavView.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "NavView.h"
#import "GlobalConfig.h"

static NavView *install = nil;

@implementation NavView

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) init
{
    self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NavView class]) owner:self options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (NavView *) shareNavView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        install = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([NavView class]) owner:self options:nil] objectAtIndex:0];
    });
    return install;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 101:
            //首页
            [NOTIFICATIONCENTER postNotificationName:NOTI_MAIN object:nil];
            break;
        case 102:
            //列表
            [NOTIFICATIONCENTER postNotificationName:NOTI_TARGER object:nil];
            break;
        case 103:
            //我的记录
            [NOTIFICATIONCENTER postNotificationName:NOTI_USER object:nil];
            break;
        case 104:
            //设置
            [NOTIFICATIONCENTER postNotificationName:NOTI_CONFIG object:nil];
            break;
            
        default:
            break;
    }
    self.hidden = YES;
}
@end
