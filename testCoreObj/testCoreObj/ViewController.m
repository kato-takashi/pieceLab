//
//  ViewController.m
//  testCoreObj
//
//  Created by Kato Takashi on 2014/12/24.
//  Copyright (c) 2014年 Kato Takashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    Setting *mscMdl;
    ManageCoreData *mcData;
    ManageCoreData *mcd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mcData = [[ManageCoreData alloc] init];
    NSMutableArray *array = [mcData getCoreData:@"Setting" predicate:nil];
    mscMdl = (Setting *)[mcData insertCoreData:@"Setting"];
    NSString *strTest = @"test";
    NSString *valueStr = [NSString stringWithFormat:@"%lu", (unsigned long)[array count]];

    // 文字列を連結
    NSString *strCoreData = [strTest stringByAppendingString: valueStr];
    
    mscMdl.key = strCoreData;
    NSInteger size = [array count];
    mscMdl.value = [NSNumber numberWithInt:(int)size];

    [mcData save];
    
    for (int i=0; i<[array count]; i++) {
        Setting *object1 = (Setting *)[mcData getCoreColumnsData:@"Setting" index:i predicate:nil];
        
        NSLog(@"===================CoreData: %d=====================", i);
        NSLog(@"%@", object1);
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
