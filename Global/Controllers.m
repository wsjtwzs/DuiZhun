//
//  Controllers.m
//  CoolProject
//
//  Created by 魔时网 on 14-6-3.
//  Copyright (c) 2014年 mosh. All rights reserved.
//

#import "Controllers.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import "UserViewController.h"
#import "RegViewController.h"
#import "ThirdLoginViewController.h"
#import "MainViewController.h"
#import "TargetListViewController.h"
#import "ConfigViewController.h"
#import "WSTabBarController.h"

@implementation Controllers

+ (UIViewController *) firstViewController
{
       NSNumber *autoLogin = [[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULT_AUTOLOGIN];
    
    if ( [autoLogin isKindOfClass:[NSNumber class]] && [autoLogin boolValue]) {
        return [Controllers mainTabbarController];
    }
    else {
        return [[BaseNavigationController alloc] initWithRootViewController:[ThirdLoginViewController new]];
    }
}

+ (UITabBarController *)mainTabbarController
{
    NSArray *array = @[[MainViewController new],
                       [TargetListViewController new],
                       [UserViewController new],
                       [ConfigViewController new]];
    
    NSMutableArray *controllerArr = [NSMutableArray new];
    
    for (UIViewController *ctl in array) {
        BaseNavigationController *navCtl = [[BaseNavigationController alloc] initWithRootViewController:ctl];
       
        [controllerArr addObject:navCtl];
    }

    
    WSTabBarController *tabbarCtl = [WSTabBarController new];
    [tabbarCtl.tabBar setHidden:YES];
    [tabbarCtl.navigationController setNavigationBarHidden:YES];
    [tabbarCtl setViewControllers:controllerArr];
    return tabbarCtl;
}

//
//+ (UIViewController *) userViewController
//{
//    return [UserViewController viewControllerWithNib];
//}
//
//+ (UIViewController *) regViewController
//{
//    return [RegViewController viewControllerWithNib];
//}
//
//+ (UIViewController *) loginViewController
//{
//    return [LoginViewController viewControllerWithNib];
//}
//
////
//+ (UIViewController *) thirdLoginViewController
//{
//    return  [ThirdLoginViewController viewControllerWithNib];
//}


@end
