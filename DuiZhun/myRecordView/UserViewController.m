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
static NSMutableArray *introArr;

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
    self.dataArray = [NSMutableArray arrayWithArray:@[@"6.jpg",
                                                      @"3.jpg",
                                                      @"2.jpg",
                                                      @"4.jpg"]];
    titleArr = [NSMutableArray arrayWithArray:@[]];
    introArr = [NSMutableArray arrayWithArray:@[]];
    
    
    //设置tableview
    self.baseTableView.frame = CGRectMake(0, 123, 320, 446);
    self.baseTableView.hidden = YES;
    self.baseTableView.alpha = 0;
    [self.view addSubview:self.baseTableView];
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
}

- (IBAction)arcPress:(id)sender {
    self.favType = YES;
    [self setSegImage];
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
    cell.userImageView.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[Controllers viewControllerWithName:@"UserDetailViewController"] animated:YES];
//    [self.tabBarController hidesBottomBarWhenPushed];
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
//    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    UserColletionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.collectionImage.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
//    cell.backgroundColor = [UIColor colorWithRed:((10 * indexPath.row) / 255.0) green:((20 * indexPath.row)/255.0) blue:((30 * indexPath.row)/255.0) alpha:1.0f];
    return cell;
}
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(155, 140);
}
//定义每个UICollectionView 的 margin
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(5, 5, 5, 5);
//}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UserDetailViewController *vc = (UserDetailViewController *)[Controllers viewControllerWithName:@"UserDetailViewController"];
    
//    vc.image = [UIImage imageNamed:self.dataArray[indexPath.row]];
    [self.navigationController pushViewController:[Controllers viewControllerWithName:@"ShareViewController"] animated:YES];
//    [self.tabBarController hidesBottomBarWhenPushed];
    
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
}
@end
