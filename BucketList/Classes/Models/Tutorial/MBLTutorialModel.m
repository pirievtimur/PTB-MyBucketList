//
//  MBLTutorialModel.m
//  BucketList
//
//  Created by Timur Piriev on 10/16/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLTutorialModel.h"

@implementation MBLTutorialModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tutorialBgImage = [NSArray arrayWithObjects:@"tutorial1", @"tutorial2", @"tutorial3", @"tutorial4", nil];
        self.tutorialIcon = [NSArray arrayWithObjects:@"tutorial_icon1", @"tutorial_icon2", @"tutorial_icon3", @"tutorial_icon4", nil];
        self.tutorialText = [NSArray arrayWithObjects:@"Create your own bucket list or choose from popular", @"Achieve your goals and share it with your friends!", @"See your completed goals!", @"Let's go", nil];
    }
    return self;
}

@end
