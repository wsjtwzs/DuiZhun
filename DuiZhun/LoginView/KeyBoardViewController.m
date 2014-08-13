//
//  KeyBoardViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-11.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "KeyBoardViewController.h"

@interface KeyBoardViewController ()

@end

@implementation KeyBoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NOTIFICATIONCENTER addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardDidShowNotification object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(keyBoardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) keyBoardWillShow:(NSNotification *)noti
{
    [GlobalConfig keyBoardDidShow:noti scrollView:_keyboardScrollView];
}

- (void) keyBoardWillHidden:(NSNotification *)noti
{
    [GlobalConfig keyBoardDidDisapper:noti scrollView:_keyboardScrollView];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
