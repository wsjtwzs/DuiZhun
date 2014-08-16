//
//  MainCell.h
//  DuiZhun
//
//  Created by wuzhensong on 14-8-13.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
#import "MainModel.h"
#import "CustomUILabel.h"

@interface MainCell : BaseCell

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet CustomUILabel *titleLable;
//@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *heart;
@property (weak, nonatomic) IBOutlet UILabel *heartNumber;

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

- (void) cellScroll:(UIScrollView *)scrollView;

@end
