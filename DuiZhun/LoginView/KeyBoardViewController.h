//
//  KeyBoardViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-11.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"

@interface KeyBoardViewController : BaseViewController<UITextFieldDelegate>
{
    UIScrollView *_keyboardScrollView;
}

- (void)letsgoWithUsername:(NSString *)username password:(NSString *)password;

@end
