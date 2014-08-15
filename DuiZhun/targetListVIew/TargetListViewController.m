//
//  TargetListViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "TargetListViewController.h"
#import "TargetCell.h"
#import "TargetModel.h" 
#import "TargetDetailViewController.h"

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
    
    NSArray *introArr = [NSMutableArray arrayWithArray:@[@"返老还童的最快速办法",
                                                @"用朋克笔法重写摇滚编年史",
                                                @"龙与地下城，哪个最可怕？",
                                                @"扫描即可打开护肤宝典",
                                                @"领取专属于你的圣诞礼包",
                                                @"打开镜头与查理一起探索奥秘",
                                                @"如果我说只溶于手是不是太low了",
                                                @"五分钟内吃饱喝好上班去",
                                                @"分分钟就能买套别墅，在伦敦",
                                                @"教你如何在北京五环外拍出雾霾效果",
                                                @"没有了好基友，美队究竟如何生存",
                                                @"实时观看，你没见过，会说话的，JB",
                                                @"扫一扫即可得知前后五千年，看脸",
                                                @"拥有自己的午夜飞车，马上"]];
    
    NSArray *heartNumber = @[@"1003",@"758",@"342",@"995",@"116",@"96",@"345",@"542",@"111",@"366",@"489",@"337",@"280",@"144"];
    
    self.dataArray = [NSMutableArray new];
    for (NSString *title in titleArray) {
        NSInteger index = [titleArray indexOfObject:title];
        TargetModel *modle = [TargetModel new];
        modle.title = title;
        modle.smallImage = [NSString stringWithFormat:@"target_list_%d.jpg",index + 1];
        modle.image = [NSString stringWithFormat:@"target_small_%d.jpg",index + 1];
        modle.heart = heartNumber[index];
        modle.subTitle = introArr[index];
        [self.dataArray addObject:modle];
    }

   
    
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
//    cell.bgImage.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    [cell setValueForCell:self.dataArray[indexPath.row]];
    
    
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TargetDetailViewController *ctl = (TargetDetailViewController *)[Controllers viewControllerWithName:@"TargetDetailViewController"];
    ctl.targetModel = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:ctl animated:YES];
    
}


- (IBAction)showMenu:(id)sender {
    [NOTIFICATIONCENTER postNotificationName:NOTI_GESTURE_LEFT object:nil];
}
@end
