//
//  AppDelegate.m
//  悬浮窗Demo
//
//  Created by fairy on 16/4/7.
//  Copyright © 2016年 fairy. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SuspendedBall.h"
#import "SecViewController.h"


@interface AppDelegate ()<SuspendedBallDelegate>
{
    SecViewController *sec;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    MainViewController *main = [[MainViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:main];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
//    NSArray *imagesArray = @[[UIImage imageNamed:@"购物车"],[UIImage imageNamed:@"购物车"],[UIImage imageNamed:@"购物车"],[UIImage imageNamed:@"购物车"]];
    [[UIApplication sharedApplication].keyWindow addSubview:[SuspendedBallView createView]];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:[SuspendedBallView createView]];
    [SuspendedBallView createView].delegate = self;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)suspendedBall:(UIView *)view {
//    [WZShowAlertView showAlertViewDuration:2.0f andPosition:AlertViewPosition_center showMessage:@"请在SuspendedBallcell代理中添加事件"];
    if (!sec) {
        sec = [[SecViewController alloc]init];
        //[self.navigationController showViewController:sec sender:nil];
        //[self.window.rootViewController.navigationController pushviewcontroller:sec animated:YES];
        //    [self.window.rootViewController presentViewController:sec animated:YES completion:^{
        //
        //    }];
        [self.window.rootViewController showViewController:sec sender:nil];

                }
        else
        {
            if (self.window.rootViewController != sec.navigationController) {
                [self.window.rootViewController showViewController:sec sender:nil];
                

        }
            }
    
    
    
//    UINavigationController *nav = self.window.rootViewController;
//    [nav.navigationController pushViewController:sec animated:YES];

    //[nav.navigationController popToRootViewControllerAnimated:YES];
    
    }

@end
