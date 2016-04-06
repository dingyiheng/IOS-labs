//
//  AppDelegate.m
//  EmptyApplication
//
//  Created by Todd Sproull on 2/8/15.
//  Copyright (c) 2015 StudentName. All rights reserved.
//

#import "AppDelegate.h"
#import "MyFirstViewController.h"
#import "MyFirstTabBarController.h"
#import "MySecondViewController.h"
#import "MyFirstTableViewController.h"
#import "MyNavigationController.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GMSServices provideAPIKey:@"AIzaSyA3iUnS0Ft33ZXRlKUArXfQNnFRrL8fRsM"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //UINavigationController* navController = [[UINavigationController alloc] init];
    MyNavigationController* navController = [[MyNavigationController alloc] init];
    MyFirstViewController* firstVC = [[MyFirstViewController alloc] init];
    MySecondViewController* secondVC = [[MySecondViewController alloc] init];
    
    firstVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
    secondVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    [firstVC setCurrent:1];
    
    [navController pushViewController:firstVC animated:YES];
    
    MyFirstTableViewController* tableVC = [[MyFirstTableViewController alloc] initWithStyle:UITableViewStylePlain];
    //tableVC.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:2];
    UINavigationController *tableViewNavController = [[UINavigationController alloc] initWithRootViewController:tableVC];
    [tableViewNavController.navigationItem setTitle:@"TABLE!~"];
    tableViewNavController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:2];
    
    
    MyFirstTabBarController* TBController = [[MyFirstTabBarController alloc] init];
    //TBController.viewControllers = @[secondVC,navController,tableVC];
    TBController.viewControllers = @[secondVC,navController,tableViewNavController];
    [[TBController.tabBar.items objectAtIndex:1] setTitle:@"first"];
    
    
    
    // two ways
    self.window.rootViewController = TBController;
    //[self.window addSubview:navController.view];
    
    
    
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
