//
//  AppDelegate.m
//  有钱
//
//  Created by Moguilay on 14-2-28.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import "AppDelegate.h"
#import "NewTaskViewController.h"//新任务VC
#import "MyTaskViewController.h"//我的任务VC
#import "RecommendAppViewController.h"//推荐AppVC
#import "PersonalCenterViewController.h"//个人中心VC
#import "TencentOpenAPI/QQApiInterface.h"
#import "TencentOpenAPI/TencentOAuth.h"

@implementation AppDelegate
//@synthesize newTaskViewControllerNav, myTaskViewControllerNav, recommendAppViewControllerNav, personalCenterViewControllerNav;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    
    
//    [DBUserMessage deleteUserMessageList];
    
    // Override point for customization after application launch.
    //创建沙盒目录 存储用户数据
    if (![GlobleFunction FileExistAtPath:DOCUMENT_DICTIONARY]) {
        [GlobleFunction CreateDictionary:DOCUMENT_DICTIONARY];
    }
    
    //测试数据
       
    
    //友盟AppKey
    [UMSocialData setAppKey:UMSOCIALKEY];
    [UMSocialConfig setWXAppId:@"wxfc9b00bdc9a42b11" url:nil];
    [UMSocialConfig setQQAppId:@"101028508" url:nil importClasses:@[[QQApiInterface class],[TencentOAuth class]]];

//    [UMSocialConfig setQQAppId:@"101028508" url:nil importClasses:@[[QQApiInterf ace class],[TencentOAuth class]]];
//[UMSocialConfig setQQAppId:@"101028508" url:nil importClasses:[]]
    
    
    //设置一级页面的四个VC
    
    
    //新任务VC
    NewTaskViewController* newTaskVC = [[NewTaskViewController alloc] initWithNibName:nil bundle:nil];
    newTaskViewControllerNav =[[UINavigationController alloc] initWithRootViewController:newTaskVC];
//    newTaskViewControllerNav.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    //推荐任务VC
    MyTaskViewController *myTaskVC = [[MyTaskViewController alloc]initWithNibName:nil bundle:nil];
    myTaskViewControllerNav =[[UINavigationController alloc]initWithRootViewController:myTaskVC];
    //推荐AppVC
    RecommendAppViewController *recommendAppVC = [[RecommendAppViewController alloc]initWithNibName:nil bundle:nil];
    recommendAppViewControllerNav = [[UINavigationController alloc]initWithRootViewController:recommendAppVC];
    //个人中心VC
    PersonalCenterViewController *personalCenterVC = [[PersonalCenterViewController alloc]initWithNibName:nil bundle:nil];
    personalCenterViewControllerNav = [[UINavigationController alloc]initWithRootViewController:personalCenterVC];
    //tabBarVC存放四个VC
    
    tabBarVC=[[UITabBarController alloc] initWithNibName:nil bundle:nil];
    tabBarVC.view.backgroundColor = [UIColor redColor];
    [tabBarVC setViewControllers:[NSArray arrayWithObjects:newTaskViewControllerNav,myTaskViewControllerNav,recommendAppViewControllerNav,personalCenterViewControllerNav,nil]];
    self.window.rootViewController = tabBarVC;
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
    
    
    //刷新界面

    
    
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}
@end
