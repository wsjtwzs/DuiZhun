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
#import "MainModel.h"
#import "MainDetailViewController.h"

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

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:self.baseTableView];
    [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha = 1;
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *titleArray = [NSMutableArray arrayWithArray:@[@"加速你的时间",
                                                           @"新专辑发行",
                                                           @"霍比特人再现",
                                                           @"保持皮肤娇嫩",
                                                           @"冬季大礼包来袭",
                                                           @"强力洗洁精",
                                                           @"最柔软的巧克力",
                                                           @"神奇早餐搭配",
                                                           @"最低地价",
                                                           @"镜头里的奥义",
                                                           @"美队归来",
                                                           @"你不知道的JB",
                                                           @"男人也识相",
                                                           @"红色旋风"]];
    NSArray *heartNumber = @[@"1003",@"758",@"342",@"995",@"116",@"96",@"345",@"542",@"111",@"366",@"489",@"337",@"280",@"144"];
    
    self.dataArray = [NSMutableArray new];
    for (NSString *title in titleArray) {
        NSInteger index = [titleArray indexOfObject:title];
        MainModel *modle = [MainModel new];
        modle.title = title;
        modle.smallImage = [NSString stringWithFormat:@"target_list_%d.jpg",index + 1];
        modle.image = [NSString stringWithFormat:@"target_small_%d.jpg",index + 1];
        modle.heart = heartNumber[index];
        [self.dataArray addObject:modle];
    }
    
    
    
    self.cellHeight = 200;
    [self.view addSubview:self.baseTableView];
//    self.baseTableView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 20);
//    [self.baseTableView addSubview:self.menu];
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([MainCell class]) bundle:nil] forCellReuseIdentifier:@"mainCell"];
    self.view.alpha = 0;
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    l.backgroundColor = CLEARCOLOR;
    l.text = @"「没有更多了」";
    l.textAlignment = NSTextAlignmentCenter;
    l.textColor = WHITECOLOR;
    l.font = [UIFont systemFontOfSize:13];
    self.baseTableView.tableFooterView = l;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CGSize size = tableView.contentSize;
//    tableView.contentSize = CGSizeMake(size.width + 0.1, size.height);
    
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
//    cell.backImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    [cell setValueForCell:self.dataArray[indexPath.row]];
    
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
    MainDetailViewController *ctl = (MainDetailViewController *)[Controllers viewControllerWithName:@"MainDetailViewController"];
    ctl.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:ctl animated:YES];
    
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
