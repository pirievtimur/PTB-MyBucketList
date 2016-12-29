//
//  AppDelegate.m
//  BucketList
//
//  Created by Timur Piriev on 10/15/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "AppDelegate.h"
#import "MBLRootViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[NSThread sleepForTimeInterval:1];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:[MBLRootViewController newInstance]];
    [navigationController setNavigationBarHidden:true];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
