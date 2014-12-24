//
//  ManageCoreData.m
//  ShowData
//
//  Created by takashi kato on 2014/12/24.
//  Copyright (c) 2014年 takashi kato. All rights reserved.
//

#import "ManageCoreData.h"
#import "AppDelegate.h"

@implementation ManageCoreData

- (id)init
{
    self = [super init];
    if (self) {
        //コンテキストを設定
        AppDelegate *application = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        context = application.managedObjectContext;
    }
    return self;
}

//セーブメソッド
//これを呼ぶことで、ファイルにデータが保存されます。
- (void)save
{
    NSError* error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
}

/*
 * コアデータの取得
 * name : テーブル名
 * predicate : 抽出条件　いらない場合はnil
 * 返り値 : mutableFetchResults
 */
- (NSMutableArray*)getCoreData:(NSString*)name predicate:(NSPredicate*)predicate
{
    //フェッチリクエスト
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    [request setEntity:entity];
    [request setFetchBatchSize:20];
    [request setReturnsObjectsAsFaults:NO];

    //フィルター
    if (nil != predicate) {
        [request setPredicate:predicate];
    }
    
    //取得する
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        NSLog(@"fetch error.");
    }
    return mutableFetchResults;
}

-(NSManagedObject*)getCoreColumnsData:(NSString*)name index:(int)index predicate:(NSPredicate*)predicate{
  
    //フェッチリクエスト
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:name inManagedObjectContext:context];
    [request setEntity:entity];
    [request setFetchBatchSize:20];
    [request setReturnsObjectsAsFaults:NO];

    //フィルター
    if (nil != predicate) {
        [request setPredicate:predicate];
    }
    
    //取得する
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[context executeFetchRequest:request error:&error] mutableCopy];
   
    if (mutableFetchResults == nil) {
        NSLog(@"fetch error.");
    }
    
    NSManagedObject *object = [mutableFetchResults objectAtIndex:index];
    return object;

}

/*
 * コアデータの追加
 * name : テーブル名
 * 返り値 : newManagedObject
 */
- (NSManagedObject*)insertCoreData:(NSString*)name
{
    // インサート
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:context];
    
    return newManagedObject;
}


/*
 * コアデータの削除
 * object : 削除したいオブジェクト
 * 返り値 : なし
 */
- (void)deleteCoreData:(NSManagedObject*)object{
    [context deleteObject:object];
}

@end
