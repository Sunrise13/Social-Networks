//
//  SLVDBManager.m
//  Social Networks
//
//  Created by Ostap R on 15.08.14.
//  Copyright (c) 2014 SoftServe Lv-120. All rights reserved.
//

#import "SLVDBManager.h"

@implementation SLVDBManager

+ (id)sharedManager
{
    static SLVDBManager *dbManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dbManager = [[self alloc] init];
        [dbManager loadStore];
    });
    return dbManager;
}

-(instancetype)init
{
    self=[super init];
    if(self)
    {
        _model=[NSManagedObjectModel mergedModelFromBundles:nil];
        _coordinator=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
        _context=[[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_context setPersistentStoreCoordinator:_coordinator];
    }
    return self;
}

-(void)loadStore
{
    if(self.store)
        return;
    self.store=[_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self storeURL] options:nil error:nil];
}

-(NSURL *)storeURL
{
    NSString *appDocDir=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *storeDir=[[NSURL fileURLWithPath:appDocDir] URLByAppendingPathComponent:@"Stores"];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:[storeDir path]])
    {
        [fileManager createDirectoryAtURL:storeDir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSURL *dbURL=[storeDir URLByAppendingPathComponent:@"Services.sqlite"];
    return dbURL;
}

-(void)saveChanges
{
    if([self.context hasChanges])
        [self.context save:nil];
}

#pragma mark - Get Objects From Table
//-(NSArray *)getServices
//{
//    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Services"];
//    NSSortDescriptor *sort=[NSSortDescriptor sortDescriptorWithKey:@"type" ascending:YES];
//    [request setSortDescriptors:@[sort]];
//    return [self.context executeFetchRequest:request error:nil];
//    
//}



@end


