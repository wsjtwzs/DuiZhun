//
//  ConfigViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TransitionViewController.h"

@interface ConfigViewController :TransitionViewController
{
    __weak IBOutlet UIImageView *configImage;

    __weak IBOutlet UIImageView *suggessImage;
    __weak IBOutlet UIImageView *cleanImage;
    __weak IBOutlet UIImageView *infoImage;
    __weak IBOutlet UIImageView *wifiImage;
    __weak IBOutlet UIButton *leftImage;
    __weak IBOutlet UILabel *cache;
    __weak IBOutlet UIImageView *bindingImage;
    __weak IBOutlet UIImageView *notiImage;
}
- (IBAction)exit:(id)sender;

- (IBAction)close:(id)sender;

- (IBAction)buttonPressed:(id)sender;
@end
