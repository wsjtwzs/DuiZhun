//
//  UserViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-1.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "UserViewController.h"
#import "IonIcons.h"
#import "UserCell.h"
#import "UserColletionCell.h"
#import "UserDetailViewController.h"
#import "CameraViewController.h"
#import "ShareViewController.h"

static NSMutableArray *titleArr;
static NSMutableArray *imgArr;
static NSMutableArray *introArr;
static NSMutableArray *heartArr;
static int _oldPointY = 0;

@interface UserViewController ()

@end

@implementation UserViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_"]];
    
    self.showType = YES;
    self.favType = YES;
    [self setSegImage];
    
    //设置两个button的高亮
    [self.arcButton setImage:[IonIcons imageWithIcon:icon_archive iconColor:[UIColor yellowColor]
                                            iconSize:29.0f
                                           imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateHighlighted];
    [self.favButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor yellowColor]
                                            iconSize:25.0f
                                           imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateHighlighted];
    
    //数据源
    imgArr = [NSMutableArray arrayWithArray:@[@"user_small_01.jpg",
                                                      @"user_small_02.jpg",
                                                      @"user_small_03.jpg",
                                                      @"user_small_04.jpg",
                                                        @"user_small_05.jpg",
                                                        @"user_small_06.jpg",
                                                        @"user_small_07.jpg",
                                                        @"user_small_08.jpg",
                                                        @"user_small_09.jpg",
                                                        @"user_small_10.jpg",
                                                        @"user_small_11.jpg",
                                                        @"user_small_12.jpg",
                                                        @"user_small_13.jpg"]];
    
    titleArr = [NSMutableArray arrayWithArray:@[@"霍比特传奇",
                                                @"朋克还是挺有看头的",
                                                @"我就是歧视黑人",
                                                @"这车的马达轰真响",
                                                @"赛车游戏独孤求败",
                                                @"美队帅的没朋友",
                                                @"一个失败的页面",
                                                @"逆光拍摄有技巧",
                                                @"世界杯模拟赛",
                                                @"这么有爱的动画谁做的",
                                                @"大叔太唠叨了谢谢",
                                                @"收集7个召唤神龙",
                                                @"歌声挺渗人的"]];
    
    introArr = [NSMutableArray arrayWithArray:@[@"「这些小个子满脸写着萌啊」",
                                                @"「这帮家伙居然还在玩音乐」",
                                                @"「但这个黑人还让我挺有感觉的」",
                                                @"「等有钱了还是要买辆RENAULT嘛」",
                                                @"「目前已领先其他选手一块钱」",
                                                @"「预告片中的彩蛋你们都发现了吗」",
                                                @"「和一个失败的动画，吐槽无能」",
                                                @"「如果你有钱到这里旅行，就有钱买个单反」",
                                                @"「但我支持的球队从来没冲出五环」",
                                                @"「你要不要也来摸一摸，有点硬」",
                                                @"「清洁员大叔和你讲公司秘闻」",
                                                @"「圣诞节麋鹿已经迷路，需求帮助」",
                                                @"「我能告诉你这段视频其实没有歌声吗」"]];
    
    heartArr = [NSMutableArray arrayWithArray:@[@"1003",@"758",@"342",@"995",@"116",@"96",@"345",@"542",@"111",@"366",@"489",@"337",@"280",@"144"]];

    for (int i=0; i<imgArr.count; i++) {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:imgArr[i],@"img",titleArr[i],@"title",introArr[i],@"intro",heartArr[i],@"heart", nil];
        
        [self.dataArray addObject:dic];
    }

    //设置tableview
    self.baseTableView.frame = CGRectMake(0, 0, 320, SCREENHEIGHT - 62);
    self.baseTableView.hidden = YES;
    self.baseTableView.alpha = 0;
    [self.cView addSubview:self.baseTableView];
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserCell class]) bundle:nil] forCellReuseIdentifier:@"userCell"];
    self.cellHeight = 383;

    //设置collectionview
    [self.userCollection registerNib:[UINib nibWithNibName:NSStringFromClass([UserColletionCell class]) bundle:nil] forCellWithReuseIdentifier:@"GradientCell"];
//    [self.userCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//更换显示类型的button
- (void) setSegImage {
    
    if (self.favType) {
        
        [self.arcButton setImage:[IonIcons imageWithIcon:icon_archive iconColor:[UIColor whiteColor]
                                                iconSize:29.0f
                                               imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateNormal];

        [self.favButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor grayColor]
                                                iconSize:25.0f
                                               imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateNormal];
        [self.favButton setBackgroundColor:CLEARCOLOR];
        [self.arcButton setBackgroundColor:BLACKCOLOR];
        
    } else {
        [self.arcButton setImage:[IonIcons imageWithIcon:icon_archive iconColor:[UIColor grayColor]
                                                iconSize:29.0f
                                               imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateNormal];
        
        
        [self.favButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor whiteColor]
                                                iconSize:25.0f
                                               imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateNormal];
        [self.arcButton setBackgroundColor:CLEARCOLOR];
        [self.favButton setBackgroundColor:BLACKCOLOR];
    }
    
}

//更换显示模式的button
- (void) setShowImage {
    if (self.showType) {
        
        [self.showButton setImage:[UIImage imageNamed:@"record_four"] forState:UIControlStateNormal];
        self.userCollection.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^(void){
            self.baseTableView.alpha = 0;
            self.userCollection.alpha = 1;
            
        } completion:^(BOOL a){
            self.baseTableView.hidden = YES;
        }];
        
    } else {
        [self.showButton setImage:[UIImage imageNamed:@"record_one"] forState:UIControlStateNormal];
        self.baseTableView.hidden = NO;
        [UIView animateWithDuration:0.3 animations:^(void){
            self.baseTableView.alpha = 1;
            self.userCollection.alpha = 0;
            
        } completion:^(BOOL a){
            self.userCollection.hidden = YES;
        }];
        
        
    }
}

- (IBAction)favPress:(id)sender {

    self.favType = NO;
    [self setSegImage];
    self.dataArray = [self randomizedArrayWithArray:self.dataArray];
    [self.baseTableView reloadData];
    [self.userCollection reloadData];
}

- (IBAction)arcPress:(id)sender {
    self.favType = YES;
    [self setSegImage];
    self.dataArray = [self randomizedArrayWithArray:self.dataArray];
    [self.baseTableView reloadData];
    [self.userCollection reloadData];
}

- (IBAction)showPress:(id)sender {
    if (self.showType) {
        self.showType = NO;
    } else {
        self.showType = YES;
    }
    [self setShowImage];
}

//tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell"];
    NSDictionary *tmpDic = self.dataArray[indexPath.row];
    cell.userImageView.image = [UIImage imageNamed:tmpDic[@"img"]];
    
    cell.title.text = tmpDic[@"title"];
    cell.intro.text = tmpDic[@"intro"];
    cell.heartNum.text = tmpDic[@"heart"];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserDetailViewController *vc = (UserDetailViewController *)[Controllers viewControllerWithName:@"UserDetailViewController"];
    NSDictionary *tmpDic = self.dataArray[indexPath.row];
    vc.image = [UIImage imageNamed:tmpDic[@"img"]];
    vc.navTitleText = tmpDic[@"title"];
    vc.introText = tmpDic[@"intro"];
    vc.imageIndex = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

//collectionview
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataArray count];
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"GradientCell";
    UserColletionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *tmpDic = self.dataArray[indexPath.row];
    cell.collectionImage.image = [UIImage imageNamed:tmpDic[@"img"]];
    cell.collectionImage.layer.masksToBounds = YES;
    cell.collectionImage.layer.cornerRadius = 3;
    return cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(155, 140);
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        UserDetailViewController *vc = (UserDetailViewController *)[Controllers viewControllerWithName:@"UserDetailViewController"];
        NSDictionary *tmpDic = self.dataArray[indexPath.row];
        vc.image = [UIImage imageNamed:tmpDic[@"img"]];
        vc.navTitleText = tmpDic[@"title"];
        vc.introText = tmpDic[@"intro"];
        vc.imageIndex = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];

}

//数组随机排序
- (NSMutableArray *) randomizedArrayWithArray:(NSArray *)array {
    
    NSMutableArray *results = [[NSMutableArray alloc]initWithArray:array];
    
    int i = [results count];
    
    while(--i > 0) {
        
        int j = rand() % (i+1);
        
        [results exchangeObjectAtIndex:i withObjectAtIndex:j];
        
    }
    
    return results;
    
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {

    if(self.showType){

        if (self.userCollection.contentOffset.y  <= POINT_Y) {
            return;
        }
        
        if (self.userCollection.contentOffset.y >= (self.userCollection.contentSize.height - self.userCollection.frame.size.height)) {
            return;
        }
        
        if (self.userCollection.contentOffset.y > _oldPointY) {
            
            if (self.topView.frame.origin.y == 0) {
                [UIView animateWithDuration:0.5 animations:^(){
                    self.topView.frame = CGRectMake(0, -52, 320, 105);
                    self.cView.frame = CGRectMake(0, 62, SCREENWIDTH, SCREENHEIGHT-62);
                }];
            }
            
        }else {
            if (self.topView.frame.origin.y == -52) {
                [UIView animateWithDuration:0.5 animations:^(){
                    self.topView.frame = CGRectMake(0, 0, 320, 105);
                    self.cView.frame = CGRectMake(0, 105, SCREENWIDTH, SCREENHEIGHT-105);
                }];
            }
        }
        _oldPointY = self.userCollection.contentOffset.y;

    } else {

        if (self.baseTableView.contentOffset.y  <= POINT_Y) {
            return;
        }
        
        if (self.baseTableView.contentOffset.y >= (self.baseTableView.contentSize.height - self.baseTableView.frame.size.height)) {
            return;
        }
        
        if (self.baseTableView.contentOffset.y > _oldPointY) {

            if (self.topView.frame.origin.y == 0 ) {
            
                [UIView animateWithDuration:0.5 animations:^(){
                    self.topView.frame = CGRectMake(0, -52, 320, 105);
                    self.cView.frame = CGRectMake(0, 62, SCREENWIDTH, SCREENHEIGHT-62);
                }];
            }

        }else {
            if (self.topView.frame.origin.y == -52) {
                [UIView animateWithDuration:0.5 animations:^(){
                    self.topView.frame = CGRectMake(0, 0, 320, 105);
                    self.cView.frame = CGRectMake(0, 105, SCREENWIDTH, SCREENHEIGHT-105);
                }];
            }
        }
        _oldPointY = self.baseTableView.contentOffset.y;

    }
    
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _oldPointY = 0;
}
@end
