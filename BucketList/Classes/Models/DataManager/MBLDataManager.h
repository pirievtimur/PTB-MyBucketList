//
//  MBLDataManager.h
//  BucketList
//
//  Created by Timur Piriev on 10/25/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MBLDataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

+ (instancetype)sharedManager;
- (void)initializeCoreData;
- (void)insertDataIntoEntity:(NSString *)title descr:(NSString *)description date:(NSDate *)date completed:(NSString *)completed;
- (void)deleteDataFromEntity:(NSManagedObject *)object;
- (void)markItemAsDone:(NSManagedObject *)object;
- (NSMutableArray *)fetchData;
- (NSMutableArray *)fetchCompletedItems;
- (NSMutableArray *)fetchUncompletedItems;

@end
