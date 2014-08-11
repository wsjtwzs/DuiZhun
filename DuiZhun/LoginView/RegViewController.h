//
//  RegViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "KeyBoardViewController.h"

@interface RegViewController : KeyBoardViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)login:(id)sender;
- (IBAction)letsgo:(id)sender;
- (IBAction)navBack:(id)sender;

@end
