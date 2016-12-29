//
//  UIViewController+MBLAdditions.h
//  BucketList
//
//  Created by Timur Piriev on 10/21/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MBLAdditions)

+ (instancetype)newInstance;
+ (NSString *)storyboardName;
+ (NSString *)className;

- (void)mbl_addChildViewController:(UIViewController*)childViewController;

@end
