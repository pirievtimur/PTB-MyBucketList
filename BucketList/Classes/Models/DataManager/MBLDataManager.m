//
//  MBLDataManager.m
//  BucketList
//
//  Created by Timur Piriev on 10/25/16.
//  Copyright © 2016 Timur Piriev. All rights reserved.
//

#import "MBLDataManager.h"

@implementation MBLDataManager

- (instancetype)init {
    self = [super init];
    if (!self) return nil;
    
    [self initializeCoreData];
    
    return self;
}

+ (instancetype)sharedManager {
    static MBLDataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MBLDataManager alloc] init];
    });
    return sharedInstance;
}

- (void)initializeCoreData
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MBLDataBase" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [self.managedObjectContext setPersistentStoreCoordinator:psc];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"MBLDataBase.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}

- (void)insertDataIntoEntity:(NSString *)title descr:(NSString *)description date:(NSDate *)date completed:(NSString *)completed {
    
    NSManagedObject *newObject = [NSEntityDescription insertNewObjectForEntityForName:@"BLItems" inManagedObjectContext:self.managedObjectContext];
    [newObject setValue:title forKey:@"title"];
    [newObject setValue:description forKey:@"desc"];
    [newObject setValue:date forKey:@"date"];
    [newObject setValue:completed forKey:@"completed"];
    
    NSError *error = nil;
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

- (void)markItemAsDone:(NSManagedObject *)object {
    [object setValue:@"yes" forKey:@"completed"];
}

- (void)deleteDataFromEntity:(NSManagedObject *)object {
    [self.managedObjectContext deleteObject:object];
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
        return;
    }
}

- (NSMutableArray *)fetchData {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"BLItems"];
    NSMutableArray *fetchedData = [[self.managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    
    return fetchedData;
}

- (NSMutableArray *)fetchCompletedItems {
    NSMutableArray *data = [self fetchData];
    NSMutableArray *fetchedData = [NSMutableArray new];
    for (id item in data) {
        if ([[item valueForKey:@"completed"] isEqual:@"yes"]) {
            [fetchedData addObject:item];
        }
    }
    return fetchedData;
}

- (NSMutableArray *)fetchUncompletedItems {
    NSMutableArray *data = [self fetchData];
    NSMutableArray *fetchedData = [NSMutableArray new];
    for (id item in data) {
        if ([[item valueForKey:@"completed"] isEqual:@"no"]) {
            [fetchedData addObject:item];
        }
    }
    return fetchedData;
}

@end
