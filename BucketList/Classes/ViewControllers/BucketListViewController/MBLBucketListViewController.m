//
//  MBLBucketListViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/22/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLBucketListViewController.h"
#import "MBLUncompletedItemsTableViewController.h"

@interface MBLBucketListViewController ()

@end

@implementation MBLBucketListViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //set up viewcontroller
    self.title = @"Bucket list";
    
    //add table view
    MBLUncompletedItemsTableViewController *uncompletedTableVC = [MBLUncompletedItemsTableViewController newInstance];
    [self mbl_addChildViewController:uncompletedTableVC];
}

@end
