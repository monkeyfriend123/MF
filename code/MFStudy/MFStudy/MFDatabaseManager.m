//
//  MFDatabaseManager.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFDatabaseManager.h"
@interface MFDatabaseManager ()

/* 数据库是否打开 */
@property (nonatomic, assign) BOOL isDatabaseOpend;

@end

static MFDatabaseManager *instance = nil;

@implementation MFDatabaseManager

@synthesize databaseQueue = _databaseQueue;
@synthesize databasePath = _databasePath;

/*单例 */
+(MFDatabaseManager*)sharedInstance
{
    @synchronized(self)
    {
        if (nil == instance) {
            instance = [[MFDatabaseManager alloc] init];
        }
    }
    return instance;
}
+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self)
    {
        if (nil == instance) {
            instance = [[super allocWithZone:zone] init];
        }
    }
    return instance;
}

/* 打开数据库 */
- (void)openDatabase
{
    if (self.isDatabaseOpend) {
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DATABASE_OPEN object:nil userInfo:nil];
        return;
    }
    _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:self.databasePath];
    if (_databaseQueue == nil) {
        self.isDatabaseOpend = NO;
        return;
    }
    [_databaseQueue inDatabase:^(FMDatabase *db) {
        [db setShouldCacheStatements:YES];
    }];
    self.isDatabaseOpend = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DATABASE_OPEN object:nil userInfo:nil];
}

/* 关闭数据库 */
- (void)closeDatabase
{
    if (!self.isDatabaseOpend) {
        return;
    }
    [_databaseQueue inDatabase:^(FMDatabase *db) {
        [db clearCachedStatements];
    }];
    [_databaseQueue close];
    self.isDatabaseOpend = NO;
    _databaseQueue = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DATABASE_CLOSE object:nil userInfo:nil];
    
}


#pragma mark - Property
- (NSString *)databasePath
{
    if (!_databasePath) {
        _databasePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/MF.sqlite"];
    }
    return _databasePath;
}
@end
