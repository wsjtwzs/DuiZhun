//
//  BIndingViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "BIndingViewController.h"

#define sheetView_rect_hidden CGRectMake(0, SCREENHEIGHT, 320, 90);
#define sheetView_rect_show CGRectMake(0, SCREENHEIGHT - 90, 320, 90);

@interface BIndingViewController ()

@end

@implementation BIndingViewController

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
    [self changeImageColor];
        self.view.backgroundColor = CLEARCOLOR;
        _usernameLabel.text = [GlobalConfig getObjectWithKey:USER_USERNAME];
    
    sheetView.frame = sheetView_rect_hidden;
    [self.view addSubview:sheetView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void) changeImageColor
{
    emailImage.image = [IonIcons imageWithIcon:icon_ios7_email size:20 color:WHITECOLOR];
    
    bindingImage.image = [IonIcons imageWithIcon:icon_log_in size:25 color:WHITECOLOR];
    
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:WHITECOLOR] forState:UIControlStateNormal];
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
}

- (IBAction)changePassword:(id)sender {
    [self sheetViewHidden:NO];
}

- (IBAction)changePasswordCancle:(id)sender {
    [self sheetViewHidden:YES];
}

- (IBAction)changePasswordCommit:(id)sender {
}

- (IBAction)close:(id)sender {
    [super close:sender];
}

- (void) sheetViewHidden:(BOOL)hidden
{
    [UIView animateWithDuration:0.2 animations:^{
        if (hidden) {
            sheetView.frame = sheetView_rect_hidden;
        }
        else {
            sheetView.frame = sheetView_rect_show;
        }
    }];
}
@end
