//
//  UserViewController.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GestureViewController.h"
#import "HMSegmentedControl.h"

@interface UserViewController : BaseTableViewController

@property (nonatomic,strong) HMSegmentedControl *segmentedControl;

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIButton *arcButton;
@property (weak, nonatomic) IBOutlet UIButton *favButton;
@property (weak, nonatomic) IBOutlet UIButton *showButton;

@property (weak, nonatomic) IBOutlet UIView *cView;
@property (weak, nonatomic) IBOutlet UICollectionView *userCollection;

- (IBAction)favPress:(id)sender;
- (IBAction)arcPress:(id)sender;
- (IBAction)showPress:(id)sender;

@property (nonatomic, assign) BOOL showType;    //显示模式yes为4格，no为1
@property (nonatomic, assign) BOOL favType;     //数据类型yes为下载，no为收藏
@end
