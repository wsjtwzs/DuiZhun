//
//  APPInfoViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "APPInfoViewController.h"

@interface APPInfoViewController ()

@end

@implementation APPInfoViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) changeImageColor
{
    
    infoImage.image = [IonIcons imageWithIcon:icon_android_information size:25 color:WHITECOLOR];
    
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:WHITECOLOR] forState:UIControlStateNormal];
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
}


- (IBAction)close:(id)sender {
    [super close:sender];
}
@end
