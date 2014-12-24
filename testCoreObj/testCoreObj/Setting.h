//
//  Setting.h
//  testCoreObj
//
//  Created by Kato Takashi on 2014/12/24.
//  Copyright (c) 2014年 Kato Takashi. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Setting : NSManagedObject
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSNumber *value;
@end
