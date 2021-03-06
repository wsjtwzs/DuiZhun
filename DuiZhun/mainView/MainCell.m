//
//  MainCell.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-13.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MainCell.h"
#import "Ionicons.h"
static CGFloat scrollContentY;
@implementation MainCell

- (void)awakeFromNib
{
    // Initialization code
    [self.heart setImage:[IonIcons imageWithIcon:icon_ios7_heart size:20 color:WHITECOLOR]];
}

- (void) setValueForCell:(BaseModel *)model
{
    MainModel *m = (MainModel *)model;
    self.backImageView.image = [UIImage imageNamed:m.image];
    self.titleLable.text = m.title;
    self.heartNumber.text = m.heart;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view
{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.backImageView.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.backImageView.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.backImageView.frame = imageRect;
}

- (void) cellScroll:(UIScrollView *)scrollView
{
    CGRect imageRect = self.backImageView.frame;
    imageRect.origin.y += (scrollView.contentOffset.y - scrollContentY)/5;
    self.backImageView.frame = imageRect;
    scrollContentY = scrollView.contentOffset.y;
}
@end
