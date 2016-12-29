//
//  MBLCompletedItemsTableViewController.m
//  BucketList
//
//  Created by Timur Piriev on 10/31/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLCompletedItemsTableViewController.h"
#import "MBLBucketListItemTableViewCell.h"
#import "MBLFullDescriptionViewController.h"
#import "MBLDataManager.h"

@implementation MBLCompletedItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //registering nib
    UINib *cellNib = [UINib nibWithNibName:@"MBLBucketListItemTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"MBLBucketListItemTableViewCell"];
}

// MARK: - UITableViewDataSource

- (void)fetchDataForTable {
    [super fetchDataForTable];
    MBLDataManager *manager = [MBLDataManager sharedManager];
    self.data = [manager fetchCompletedItems];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"MBLBucketListItemTableViewCell";
    MBLBucketListItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSManagedObject *object = [self.data objectAtIndex:indexPath.row];
    cell.itemTitle.text = [object valueForKey:@"title"];
    cell.itemImage.image = [UIImage imageNamed:@"completed_item_icon"];
    
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MBLFullDescriptionViewController *fullDescVC = [MBLFullDescriptionViewController newInstance];
    fullDescVC.data = [self.data objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:fullDescVC animated:true];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObject *objectToDelete = [self.data objectAtIndex:indexPath.row];
        MBLDataManager *manager = [MBLDataManager sharedManager];
        [manager deleteDataFromEntity:objectToDelete];
        [self.data removeObject:objectToDelete];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
