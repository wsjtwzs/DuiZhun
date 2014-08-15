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
    buttonPressed_main      = 100,
    buttonPressed_target    = 101,
    buttonPressed_userRecord    = 102,
    buttonPressed_config    =  103,
}buttonPressed;

@interface GuideViewController ()
{
    NSArray *_iconArray;
    NSArray *_titleArray;
    GuideCell *_selectCell;
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
    self.view.backgroundColor = CLEARCOLOR;
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:ges];
    self.cellHeight = 65;
    [self.view addSubview:self.baseTableView];
    [self.baseTableView registerNib:[UINib nibWithNibName:NSStringFromClass([GuideCell class]) bundle:nil] forCellReuseIdentifier:@"GuideCell"];
    self.baseTableView.frame = CGRectOffset(self.baseTableView.frame, 0, 100);
    _iconArray = @[icon_home,icon_pricetag,icon_person,icon_settings];
    _titleArray = @[@"首页",@"目标列表",@"我的记录",@"设置"];
    
    
    //相机按钮
    [self.view addSubview:self.camButton];
    

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

    cell.iconImage.image = [IonIcons imageWithIcon:_iconArray[indexPath.row] size:30 color:(indexPath.row == 0 ? BLACKCOLOR :WHITECOLOR)];
    cell.titleLabel.text = _titleArray[indexPath.row];
    cell.titleLabel.textColor = (indexPath.row == 0 ? BLACKCOLOR :WHITECOLOR);
    if (indexPath.row == 0) {
        _selectCell = cell;
        cell.backgroundVIew.backgroundColor = YELLOWCOLOR;
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectCell) {
        NSIndexPath *index = [tableView indexPathForCell:_selectCell];
        _selectCell.iconImage.image = [IonIcons imageWithIcon:_iconArray[index.row] size:30 color:WHITECOLOR];
        _selectCell.titleLabel.textColor = WHITECOLOR;
        _selectCell.backgroundVIew.backgroundColor = CLEARCOLOR;
    }
    GuideCell *cell = (GuideCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.iconImage.image = [IonIcons imageWithIcon:_iconArray[indexPath.row] size:30 color:BLACKCOLOR];
    cell.backgroundVIew.backgroundColor = YELLOWCOLOR;
    cell.titleLabel.textColor = BLACKCOLOR;
    _selectCell = cell;
    [self buttonPressed:(indexPath.row + 100)];
}

- (IBAction)buttonPressed:(NSInteger)tag {

    switch (tag) {
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

- (IBAction)openCam:(id)sender {
            [self.navigationController pushViewController:[Controllers viewControllerWithName:@"CameraViewController"] animated:YES];
    
}


@end
