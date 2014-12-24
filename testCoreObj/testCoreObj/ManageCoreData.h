//
//  ManageCoreData.h
//  ShowData
//
//  Created by okitokagechika on 2014/05/10.
//  Copyright (c) 2014年 okito.kagechika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ManageCoreData : NSObject{
    NSManagedObjectContext *context;
}

- (void)save;
- (NSMutableArray*)getCoreData:(NSString*)name predicate:(NSPredicate*)predicate;
- (NSManagedObject*)insertCoreData:(NSString*)name;
- (NSManagedObject*)getCoreColumnsData:(NSString*)name index:(int)index predicate:(NSPredicate*)predicate;
- (void)deleteCoreData:(NSManagedObject*)object;

@end
