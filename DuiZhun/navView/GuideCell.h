//
//  GuideCell.h
//  DuiZhun
//
//  Created by 魔时网 on 14-8-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@interface GuideCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *backgroundVIew;

@end
