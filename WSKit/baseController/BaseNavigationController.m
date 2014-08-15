//
//  BaseNavigationController.m
//  modelTest
//
//  Created by 魔时网 on 13-10-31.
//  Copyright (c) 2013年 mosh. All rights reserved.
//

#import "BaseNavigationController.h"
#import "GlobalConfig.h"


@interface BaseNavigationController ()
@end
@implementation BaseNavigationController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:NAVIMAGE] forBarMetrics:UIBarMetricsDefault];
//    self.interactivePopGestureRecognizer.enabled = YES;
    
    self.view.backgroundColor = CLEARCOLOR;
    //标题字体变成白色
    if ([GlobalConfig versionIsIOS7]) {
        [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
        
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//
//
//-(id)initWithRootViewController:(UIViewController *)rootViewController
//{
//    BaseNavigationController* nvc = [super initWithRootViewController:rootViewController];
//    self.interactivePopGestureRecognizer.delegate = self;
//    nvc.delegate = self;
//    return nvc;
//}
//
//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//}
//-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (navigationController.viewControllers.count == 1)
//        self.currentShowVC = Nil;
//    else
//        self.currentShowVC = viewController;
//}
//
//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
//{
//    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
//        return (self.currentShowVC == self.topViewController); //the most important
//    }
//    return YES;
//}
//

@end
