//
//  UIViewController+MBLAdditions.m
//  BucketList
//
//  Created by Timur Piriev on 10/21/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "UIViewController+MBLAdditions.h"
#import "Masonry.h"

@implementation UIViewController (MBLAdditions)

+ (instancetype)newInstance {
    NSString* storyboardName = [self storyboardName];
    NSString* className = [self className];
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    id newInstance = [sb instantiateViewControllerWithIdentifier:className];
    
    return newInstance;
}

+ (NSString *)storyboardName {
    return [[NSStringFromClass(self) componentsSeparatedByString:@"."] lastObject];
}

+ (NSString *)className {
    return [[NSStringFromClass(self) componentsSeparatedByString:@"."] lastObject];
}

- (void)mbl_addChildViewController:(UIViewController *)childViewController {
    [self addChildViewController:childViewController];
    [childViewController willMoveToParentViewController:self];
    [self.view addSubview:childViewController.view];
    [childViewController didMoveToParentViewController:self];
    [childViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
