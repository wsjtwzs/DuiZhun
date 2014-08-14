//
//  GuideViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-10.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "GuideViewController.h"
#import "GuideCell.h"
#import "IonIcons.h"

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
    self.cellHeight = 65;
    [self.view addSubview:self.baseTableView];
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([GuideCell class]) bundle:nil] forCellReuseIdentifier:@"GuideCell"];
    self.baseTableView.frame = CGRectOffset(self.baseTableView.frame, 0, 100);
    _iconArray = @[icon_home,icon_pricetag,icon_person,icon_settings];
    _titleArray = @[@"首页",@"目标列表",@"我的记录",@"设置"];
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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GuideCell"];
//    cell.imageView.image = [UIImage imageNamed:]
    cell.iconImage.image = [IonIcons imageWithIcon:_iconArray[indexPath.row] size:30 color:WHITECOLOR];
    
    cell.titleLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuideCell *cell = (GuideCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.iconImage.image = [IonIcons imageWithIcon:_iconArray[indexPath.row] size:30 color:YELLOWCOLOR];
    
    cell.titleLabel.textColor = YELLOWCOLOR;
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
