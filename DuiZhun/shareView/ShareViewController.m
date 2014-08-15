//
//  ShareViewController.m
//  Unity-iPhone
//
//  Created by  evafan2003 on 14-8-13.
//
//

#import "ShareViewController.h"
#import <AssetsLibrary/ALAssetsLibrary.h>

@interface ShareViewController ()

@end

static BOOL actSina;
static BOOL actTencent;
static BOOL actWX;

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
    //初始化
    actSina = NO;
    actTencent = NO;
    actWX = NO;
    self.video = NO;
    [self.playMark setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    if (self.video) {
        self.playMark.hidden = NO;
    } else {
        self.playMark.hidden = YES;
    }

    self.paperClip.image = [IonIcons imageWithIcon:icon_paperclip iconColor:YELLOWCOLOR
                                          iconSize:20.0f
                                         imageSize:CGSizeMake(20.0f, 20.0f)];

    self.lib = [[ALAssetsLibrary alloc] init];
    
    if (self.video) {
        //取视频
        
    } else {
        //取图片
        if (!self.image) {
            
            self.imageView.image = [UIImage imageNamed:@"2.jpg"];
            
        } else {
            self.imageView.image = self.image;
        }

        
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
    [self setSinaType];
}

- (IBAction)tPress:(id)sender {
    [self setTType];
}

- (IBAction)wxPress:(id)sender {
    [self setWxType];
}

- (IBAction)share:(id)sender {
    
    //保存图片
    //创建一个相册到相册资源中，并通过block返回创建成功的相册ALAssetsGroup
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library addAssetsGroupAlbumWithName:@"DuiZhun"
                             resultBlock:^(ALAssetsGroup *group)
     {
         
         
     }
                            failureBlock:nil];
    //保存
    [library saveImage:self.image toAlbum:@"DuiZhun" withCompletionBlock:^(NSError *error) {
        
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"" message:@"分享成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [a show];
        
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }
    }];
}

-(void) setSinaType {
    if (actSina) {
        [self.sinaButton setImage:[UIImage imageNamed:@"share_sina_"] forState:UIControlStateNormal];
        actSina = NO;
    } else {
        [self.sinaButton setImage:[UIImage imageNamed:@"share_sina_h"] forState:UIControlStateNormal];
        actSina = YES;
    }
}

-(void) setTType {
    if (actTencent) {
        [self.tButton setImage:[UIImage imageNamed:@"share_tengxun"] forState:UIControlStateNormal];
        actTencent = NO;
    } else {
        [self.tButton setImage:[UIImage imageNamed:@"share_tengxun_h"] forState:UIControlStateNormal];
        actTencent = YES;
    }
    
}

-(void) setWxType {
    
    if (actWX) {
        [self.wxButton setImage:[UIImage imageNamed:@"share_wechat"] forState:UIControlStateNormal];
        actWX = NO;
    } else {
        [self.wxButton setImage:[UIImage imageNamed:@"share_wechat_h"] forState:UIControlStateNormal];
        actWX = YES;
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
