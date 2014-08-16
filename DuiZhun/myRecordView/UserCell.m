//
//  UserCell.m
//  DuiZhun
//
//  Created by  evafan2003 on 14-8-14.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "UserCell.h"
#import "IonIcons.h"
@implementation UserCell

- (void)awakeFromNib
{
    // Initialization code
    [self.heart setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor whiteColor]
                                        iconSize:18.0f
                                       imageSize:CGSizeMake(18.0f, 18.0f)]];
//    self.userImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.userImageView.layer.masksToBounds = YES;
    self.userImageView.layer.cornerRadius = 4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
