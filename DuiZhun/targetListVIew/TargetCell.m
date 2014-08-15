//
//  TargetCell.m
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-16.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TargetCell.h"
#import "GlobalConfig.h"
#import "IonIcons.h"
#import "TargetModel.h"

@implementation TargetCell

- (void)awakeFromNib
{
    // Initialization code
    [self.heart setImage:[IonIcons imageWithIcon:icon_ios7_heart size:20 color:WHITECOLOR]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setValueForCell:(BaseModel *)model
{
    TargetModel *m = (TargetModel *)model;
    self.bgImage.image = [UIImage imageNamed:m.smallImage];
    self.title.text = m.title;
    self.heartNumber.text = m.heart;
    self.subtitle.text = m.subTitle;
}

@end
