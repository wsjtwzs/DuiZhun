//
//  UserDetailViewController.h
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-15.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BaseViewController.h"

@interface UserDetailViewController : BaseViewController{
    
    IBOutlet UIView *shareView;
    
}
@property (weak, nonatomic) IBOutlet UILabel *navTitle;
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIButton *heart;
@property (weak, nonatomic) IBOutlet UIButton *share;
@property (weak, nonatomic) IBOutlet UIButton *remove;

@property (weak, nonatomic) IBOutlet UIView *black;

@property (strong, nonatomic) UIImage *image;
- (IBAction)heartPress:(id)sender;
- (IBAction)sharePress:(id)sender;
- (IBAction)removePress:(id)sender;
- (IBAction)showBig:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *buttomView;

@property (nonatomic, strong) NSString *navTitleText;
@property (nonatomic, strong) NSString *introText;
@property (nonatomic, strong) NSString *heartNum;
@property (nonatomic, assign) int imageIndex;
@end
