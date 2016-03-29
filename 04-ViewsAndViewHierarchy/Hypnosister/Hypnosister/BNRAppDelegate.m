//
//  BNRAppDelegate.m
//  Hypnosister
//
//  Created by John Gallagher on 1/6/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisView.h"
#import "BNRViewController.h"
@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {//当 userActivity 是 NSUserActivityTypeBrowsingWeb 类型, 则意味着它已经由通用链接 API 代理。这样的话, 它保证用户打开的 URL 将有一个非空的 webpageURL 属性
        NSURL *webUrl = userActivity.webpageURL;
        if ([webUrl.host isEqualToString:@"domain.com"]) {
            //打开对应页面
        } else {
            // 不能识别，使用safari打开
            [[UIApplication sharedApplication] openURL:webUrl];
        }
    }

    return  YES;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    NSLog(@"%f",self.window.bounds.size.height);
    // Override point for customization after application launch.

    
    BNRViewController *bnrVC = [[BNRViewController alloc] init];
    self.window.rootViewController = bnrVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
