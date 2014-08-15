//
//  MainDetailViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-13.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"
#import "GestureViewController.h"
#import "MainModel.h"

@interface MainDetailViewController : BaseViewController
{
    
    IBOutlet UIView *shareView;
    __weak IBOutlet UIImageView *heartImage;
}
@property (nonatomic, strong) MainModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *heartNumber;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *heartButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
- (IBAction)buttonPressed:(id)sender;

- (IBAction)shareCancle:(id)sender;

- (IBAction)shareTotengxun:(id)sender;
- (IBAction)shareTowechat:(id)sender;

- (IBAction)shareToSina:(id)sender;

@end
