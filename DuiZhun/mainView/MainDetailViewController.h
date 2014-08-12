//
//  MainDetailViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-13.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"

@interface MainDetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *heartNumber;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *heartButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
- (IBAction)buttonPressed:(id)sender;

@end
