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
    // Segmented control
    self.showType = YES;
    self.favType = YES;
    [self setSegImage];
    self.baseTableView.frame = CGRectMake(0, 123, 320, 446);
    [self.view addSubview:self.baseTableView];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"6.jpg",@"3.jpg",@"2.jpg",@"4.jpg"]];
    self.cellHeight = 383;
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([UserCell class]) bundle:nil] forCellReuseIdentifier:@"userCell"];
    

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
    } else {
        [self.arcButton setImage:[IonIcons imageWithIcon:icon_archive iconColor:[UIColor grayColor]
                                                iconSize:29.0f
                                               imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateNormal];
        
        [self.favButton setImage:[IonIcons imageWithIcon:icon_ios7_heart iconColor:[UIColor whiteColor]
                                                iconSize:25.0f
                                               imageSize:CGSizeMake(160.0f, 53.0f)] forState:UIControlStateNormal];
    }
    
}

//更换显示模式的button
- (void) setShowImage {
    if (self.showType) {
        
        [self.showButton setImage:[UIImage imageNamed:@"record_four"] forState:UIControlStateNormal];
    } else {
        [self.showButton setImage:[UIImage imageNamed:@"record_one"] forState:UIControlStateNormal];
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
    [self.navigationController pushViewController:[Controllers viewControllerWithName:@"MainDetailViewController"] animated:YES];
    [self.tabBarController hidesBottomBarWhenPushed];
}


@end
