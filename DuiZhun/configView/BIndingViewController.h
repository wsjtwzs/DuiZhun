//
//  BIndingViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransitionViewController.h"

@interface BIndingViewController : TransitionViewController
{

    __weak IBOutlet UIImageView *emailImage;
    __weak IBOutlet UIButton *leftImage;
    __weak IBOutlet UIImageView *bindingImage;
}

- (IBAction)close:(id)sender;
@end
