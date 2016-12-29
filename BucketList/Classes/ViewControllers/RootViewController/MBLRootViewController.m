//
//  MBLRootViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/15/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLRootViewController.h"
#import "MBLTutorialViewController.h"
#import "MBLBucketListViewController.h"
#import "MBLCompletedItemsViewController.h"
#import "MBLAboutViewController.h"
#import "MBLDataManager.h"
#import "UIColor+MBLAdditions.h"

@interface MBLRootViewController ()

@property (atomic) NSInteger num;

@end

@implementation MBLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self addTabBarController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // tutorial logic
    [self displayTutorial];
}

- (void)addTabBarController {
    UITabBarController* mainTabBarController = [[UITabBarController alloc] init];
    
    //init vc's with navigation controllers for tabbar
    UINavigationController* bucketListVcNavContr = [[UINavigationController alloc] initWithRootViewController:[MBLBucketListViewController newInstance]];
    UINavigationController* completedItemsVcNavContr = [[UINavigationController alloc] initWithRootViewController:[MBLCompletedItemsViewController newInstance]];
    UINavigationController* settingVcNavContr = [[UINavigationController alloc] initWithRootViewController:[MBLAboutViewController newInstance]];
    
    //adding vc's to tab bar array
    NSArray* tabBarControllers = [NSArray arrayWithObjects:bucketListVcNavContr, completedItemsVcNavContr, settingVcNavContr, nil];
    mainTabBarController.viewControllers = tabBarControllers;
    
    //set tab bar's items
    UITabBar *tabBar = mainTabBarController.tabBar;
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    
    UIImage *firstObjImage = [[UIImage imageNamed:@"uncompleted_list_tabbar_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *firstObjImageSelected = [[UIImage imageNamed:@"uncompleted_list_tabbar_icon_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem1 setImage:firstObjImage];
    [tabBarItem1 setSelectedImage:firstObjImageSelected];
    
    UIImage *secondObjImage = [[UIImage imageNamed:@"completed_list_tabbar_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *secondObjImageSelected = [[UIImage imageNamed:@"completed_list_tabbar_icon_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem2 setImage:secondObjImage];
    [tabBarItem2 setSelectedImage:secondObjImageSelected];
    
    UIImage *thirdObjImage = [[UIImage imageNamed:@"settings_tabbar_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *thirdObjImageSelected = [[UIImage imageNamed:@"settings_tabbar_icon_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [tabBarItem3 setImage:thirdObjImage];
    [tabBarItem3 setSelectedImage:thirdObjImageSelected];
    
    //set tab bar background
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab_bar_image"]];
    [[UITabBar appearance] setTintColor:[UIColor tintTabBarColor]];
    
    //showing tab bar
    [self mbl_addChildViewController:mainTabBarController];
}

- (void)setupNavBar {
    [[UINavigationBar appearance] setBarTintColor:[UIColor navigationBarColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor navBarItemsColor], NSFontAttributeName: [UIFont fontWithName:@".HelveticaNeueDeskInterface-Thin" size:24]}];
    [[UINavigationBar appearance] setTintColor:[UIColor navBarItemsColor]];
}

// MARK: - NSUserDefaults methods

- (void)displayTutorial {
    if ([self showTutorial]) {
        MBLTutorialViewController *tutorialVC = [MBLTutorialViewController newInstance];
        [self presentViewController:tutorialVC animated:YES completion: ^{
            [self disableTutorial];
        }];
    }
}

- (BOOL)showTutorial {
    NSString *tutorial = [[NSUserDefaults standardUserDefaults] objectForKey:@"tutorial"];
    if (tutorial) {
        return [tutorial isEqualToString:@"yes"] ? YES : NO;
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"tutorial"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
}

- (void)disableTutorial {
    [[NSUserDefaults standardUserDefaults] setObject:@"no" forKey:@"tutorial"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
