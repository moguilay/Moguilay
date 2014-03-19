//
//  AppDelegate.h
//  有钱
//
//  Created by Moguilay on 14-2-28.
//  Copyright (c) 2014年 qiansheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UITabBarController* tabBarVC;
    
    
//    
//    
    UINavigationController *newTaskViewControllerNav;
    UINavigationController *myTaskViewControllerNav;
    UINavigationController *recommendAppViewControllerNav;
    UINavigationController *personalCenterViewControllerNav;
    
   
   
    
}

@property (strong, nonatomic) UIWindow *window;
//@property(nonatomic, strong)UINavigationController *newTaskViewControllerNav;
//@property(nonatomic, strong)UINavigationController *myTaskViewControllerNav;
//@property(nonatomic, strong)UINavigationController *recommendAppViewControllerNav;
//@property(nonatomic, strong)UINavigationController *personalCenterViewControllerNav;
@end
