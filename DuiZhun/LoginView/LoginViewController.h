//
//  LoginViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "KeyBoardViewController.h"

@interface LoginViewController : KeyBoardViewController
{
    __weak IBOutlet UIButton *leftImage;

}
@property (nonatomic ,weak) IBOutlet UIScrollView *scrollView;
- (IBAction)reg:(id)sender;
- (IBAction)letsgo:(id)sender;
- (IBAction)navBack:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *user_icon;
@property (weak, nonatomic) IBOutlet UIImageView *pass_icon;

- (IBAction)user_start:(id)sender;
- (IBAction)user_end:(id)sender;

- (IBAction)pass_start:(id)sender;
- (IBAction)pass_end:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *user_field;
@property (weak, nonatomic) IBOutlet UITextField *pass_field;

@end
