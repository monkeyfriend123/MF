//
//  MFDatabaseManager.h
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
@interface MFDatabaseManager : NSObject
{
    FMDatabaseQueue *_databaseQueue;
    NSString  *_databasePath;
}
/* 数据库路径 */
@property (nonatomic, strong,readonly) NSString *databasePath;

@property (nonatomic, strong,readonly) FMDatabaseQueue *databaseQueue;
/*单例 */
+(MFDatabaseManager*)sharedInstance;

/* 打开数据库 */
- (void)openDatabase;

/* 关闭数据库 */
- (void)closeDatabase;

/* 数据库是否打开 */
- (BOOL)isDatabaseOpend;
@end
