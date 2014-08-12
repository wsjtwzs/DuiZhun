//
//  MainViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    self.dataArray = [NSMutableArray arrayWithArray:@[@"6.jpg",@"3.jpg",@"2.jpg",@"4.jpg"]];
    self.cellHeight = 200;
    [self.view addSubview:self.baseTableView];
    self.baseTableView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainCell class]) bundle:nil] forCellReuseIdentifier:@"mainCell"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    cell.backImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[Controllers viewControllerWithName:@"MainDetailViewController"] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
