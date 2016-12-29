//
//  MBLTableViewController.m
//  BucketList
//
//  Created by Timur Piriev on 12/29/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLTableViewController.h"

@implementation MBLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set autoresize for cells
    self.tableView.contentMode = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    [self fetchDataForTable];
}

- (void)fetchDataForTable { }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
