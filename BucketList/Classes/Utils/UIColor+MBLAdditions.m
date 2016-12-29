//
//  UIColor+MBLAdditions.m
//  BucketList
//
//  Created by Timur Piriev on 11/10/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "UIColor+MBLAdditions.h"

@implementation UIColor (MBLAdditions)

+ (UIColor*)navigationBarColor {
    return [UIColor colorWithRed:85.0/255.0 green:92.0/255.0 blue:131.0/255.0 alpha:1.0];
}

+ (UIColor*)navBarItemsColor {
    return [UIColor whiteColor];
}

+ (UIColor*)tintTabBarColor {
    return [UIColor whiteColor];
}

+ (UIColor*)colorForBorder {
//    return [UIColor blackColor];
    return [UIColor lightGrayColor];
}

+ (UIColor*)colorForTutorialBorder {
    return [UIColor whiteColor];
}

@end
