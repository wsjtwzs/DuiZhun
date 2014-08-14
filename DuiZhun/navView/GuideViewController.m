//
//  GuideViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GuideViewController.h"
//#import "GUideCell.h"

typedef enum {
    buttonPressed_main      = 101,
    buttonPressed_target    = 102,
    buttonPressed_userRecord    = 103,
    buttonPressed_config    =  104,
}buttonPressed;

@interface GuideViewController ()
{
    NSArray *_iconArray;
    NSArray *_titleArray;
}

@end

@implementation GuideViewController

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
    
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:ges];
    
    [self.view addSubview:self.baseTableView];
    [self.baseTableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"GuideCell"];
    
//    _iconArray = [@""]
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) pan:(UIPanGestureRecognizer *)rec
{
    [NOTIFICATIONCENTER  postNotificationName:NOTI_GESTURE_RIGHT object:rec];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GuideCell"];
//    cell.imageView.image = [UIImage imageNamed:]
    return cell;
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case buttonPressed_main:
            //首页
            [NOTIFICATIONCENTER postNotificationName:NOTI_MAIN object:nil];
             [NOTIFICATIONCENTER postNotificationName:NOTI_NAVBUTTON_PRESS object:nil];
            break;
        case buttonPressed_target:
            //列表
//            [NOTIFICATIONCENTER postNotificationName:NOTI_TARGER object:nil];
//             [NOTIFICATIONCENTER postNotificationName:NOTI_NAVBUTTON_PRESS object:nil];
            [NOTIFICATIONCENTER postNotificationName:NOTI_MAIN object:nil];
            [NOTIFICATIONCENTER postNotificationName:NOTI_NAVBUTTON_PRESS object:nil];
            break;
        case buttonPressed_userRecord:
            //我的记录
            [NOTIFICATIONCENTER postNotificationName:NOTI_USER object:nil];
             [NOTIFICATIONCENTER postNotificationName:NOTI_NAVBUTTON_PRESS object:nil];
            break;
        case buttonPressed_config:
        {
            //设置
            [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"ConfigViewController"]];
            
            break;
        }
        default:
            break;
    }
   
}

- (IBAction)search:(id)sender
{
//    [self transitionWithType:TransitionType_push fromViewController:self toView:[Controllers viewControllerWithName:@"SearchViewController"]];

}


@end
