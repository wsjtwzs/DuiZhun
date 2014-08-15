//
//  TargetListViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TargetListViewController.h"
#import "TargetCell.h"

@interface TargetListViewController ()

@end

@implementation TargetListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"6.jpg",@"3.jpg",@"2.jpg",@"4.jpg",@"6.jpg",@"3.jpg",@"2.jpg",@"4.jpg"]];
    self.cellHeight = 200;
    [self.view addSubview:self.baseTableView];
    self.baseTableView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TargetCell class]) bundle:nil] forCellReuseIdentifier:@"targetCell"];
    
    self.menuButton.frame = CGRectOffset(self.menuButton.frame, 250, 20);
    [self.baseTableView addSubview:self.menuButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    CGSize size = tableView.contentSize;
    //    tableView.contentSize = CGSizeMake(size.width + 0.1, size.height);
    
    TargetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"targetCell"];
    cell.bgImage.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    
    
    //    static NSString *CellIdentifier = @"parallaxCell";
    //    JBParallaxCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //
    //    cell.titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Cell %d",), indexPath.row];
    //    cell.subtitleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"This is a parallex cell %d",),indexPath.row];
    //    cell.parallaxImage.image = self.dataArray[indexPath.row];
    return cell;
}

//- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.navigationController pushViewController:[Controllers viewControllerWithName:@"MainDetailViewController"] animated:YES];
//    [self.tabBarController hidesBottomBarWhenPushed];
//}


- (IBAction)showMenu:(id)sender {
    [NOTIFICATIONCENTER postNotificationName:NOTI_GESTURE_LEFT object:nil];
}
@end
