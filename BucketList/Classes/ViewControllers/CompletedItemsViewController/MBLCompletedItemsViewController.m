//
//  MBLCompletedItemsViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/22/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLCompletedItemsViewController.h"
#import "MBLCompletedItemsTableViewController.h"

@interface MBLCompletedItemsViewController ()

@end

@implementation MBLCompletedItemsViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title = [NSString stringWithFormat:@"Completed Items"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MBLCompletedItemsTableViewController *completedTableVC = [MBLCompletedItemsTableViewController newInstance];
    [self mbl_addChildViewController:completedTableVC];
}

@end
