//
//  MBLTableViewController.h
//  BucketList
//
//  Created by Timur Piriev on 12/29/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBLTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *data;

- (void)fetchDataForTable;

@end
