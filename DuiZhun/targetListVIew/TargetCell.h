//
//  TargetCell.h
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
#import "CustomUILabel.h"

@interface TargetCell : BaseCell
@property (weak, nonatomic) IBOutlet UIImageView *heart;
@property (weak, nonatomic) IBOutlet UILabel *heartNumber;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet CustomUILabel *subtitle;
@property (weak, nonatomic) IBOutlet CustomUILabel *title;

@end
