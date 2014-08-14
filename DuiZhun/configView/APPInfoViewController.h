//
//  APPInfoViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransitionViewController.h"

@interface APPInfoViewController : TransitionViewController
{
    
    __weak IBOutlet UIImageView *infoImage;
    __weak IBOutlet UIButton *leftImage;
}

- (IBAction)close:(id)sender;

@end
