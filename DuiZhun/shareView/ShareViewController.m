//
//  ShareViewController.m
//  Unity-iPhone
//
//  Created by  evafan2003 on 14-8-13.
//
//

#import "ShareViewController.h"
//#import "MediaPlayerViewController.h"


@interface ShareViewController ()

@end

@implementation ShareViewController

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
    // Do any additional setup after loading the view.
    self.lib = [[ALAssetsLibrary alloc] init];
    
    
    if (self.video) {
        //取视频
        
    } else {
        //取图片
//        self.image 
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sinaPress:(id)sender {
}

- (IBAction)tPress:(id)sender {
}

- (IBAction)wxPress:(id)sender {
}

- (IBAction)share:(id)sender {
}
@end
