//
//  MBLFullDescriptionViewController.h
//  BucketList
//
//  Created by Timur Piriev on 11/1/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MBLAdditions.h"
#import "MBLDataManager.h"

@interface MBLFullDescriptionViewController : UIViewController

@property (nonatomic, strong) NSManagedObject *data;

@end
