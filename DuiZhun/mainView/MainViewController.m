//
//  MainViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"
#import "JBParallaxCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    }
    return self;
}

//- (void) viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self scrollViewDidScroll:self.baseTableView];
//    [UIView animateWithDuration:0.5 animations:^{
//        self.view.alpha = 1;
//    }];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"6.jpg",@"3.jpg",@"2.jpg",@"4.jpg",@"6.jpg",@"3.jpg",@"2.jpg",@"4.jpg"]];
    self.cellHeight = 200;
    [self.view addSubview:self.baseTableView];
    self.baseTableView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    [self.baseTableView addSubview:self.menu];
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainCell class]) bundle:nil] forCellReuseIdentifier:@"mainCell"];
//    self.view.alpha = 0;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CGSize size = tableView.contentSize;
//    tableView.contentSize = CGSizeMake(size.width + 0.1, size.height);
    
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    cell.backImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    
    
//    static NSString *CellIdentifier = @"parallaxCell";
//    JBParallaxCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    cell.titleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Cell %d",), indexPath.row];
//    cell.subtitleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"This is a parallex cell %d",),indexPath.row];
//    cell.parallaxImage.image = self.dataArray[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[Controllers viewControllerWithName:@"MainDetailViewController"] animated:YES];
    [self.tabBarController hidesBottomBarWhenPushed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu:(id)sender {
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Get visible cells on table view.
    NSArray *visibleCells = [self.baseTableView visibleCells];
    
//    for (MainCell *cell in visibleCells) {
//        [cell cellOnTableView:self.baseTableView didScrollOnView:self.view];
//    }
    
    for (MainCell *cell in visibleCells) {
        [cell cellOnTableView:self.baseTableView didScrollOnView:self.view];
//        [cell cellScroll:scrollView];
    }
}

@end
