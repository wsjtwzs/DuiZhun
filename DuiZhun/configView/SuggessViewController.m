//
//  SuggessViewController.m
//  DuiZhun
//
//  Created by wuzhensong on 14-8-12.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "SuggessViewController.h"

@interface SuggessViewController ()

@end

@implementation SuggessViewController

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
    
    suggessImage.image = [IonIcons imageWithIcon:icon_chatbox_working size:25 color:WHITECOLOR];
    
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:WHITECOLOR] forState:UIControlStateNormal];
    [leftImage setBackgroundImage:[IonIcons imageWithIcon:icon_ios7_arrow_left size:27 color:YELLOWCOLOR] forState:UIControlStateHighlighted];
}


- (void) textViewDidChange:(UITextView *)textView
{
    self.lenthLabel.text = [NSString stringWithFormat:@"%d/300",textView.text.length];
    if (textView.text.length > 300) {
        self.lenthLabel.textColor = [UIColor redColor];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textView resignFirstResponder];
}


- (IBAction)close:(id)sender {
    [super close:sender];
}

- (IBAction)submit:(id)sender {
    [GlobalConfig alert:@"提交成功，我们会及时处理，谢谢！"];
    [self transitionWithType:TransitionType_pop fromViewController:self toView:nil];
    
}
@end
