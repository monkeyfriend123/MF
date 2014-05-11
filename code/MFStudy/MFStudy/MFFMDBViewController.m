//
//  MFFMDBViewController.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFFMDBViewController.h"
#import "FMDatabaseQueue.h"
#import "MFDatabaseManager.h"
@interface MFFMDBViewController ()
- (IBAction)createOneTable:(id)sender;
- (IBAction)dropOneTable:(id)sender;

- (IBAction)addOneRecord:(id)sender;
- (IBAction)deleteAll:(id)sender;
@end

@implementation MFFMDBViewController
- (void)dealloc
{
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"FMDB";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createOneTable:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        FMDatabaseQueue *queue = [MFDatabaseManager sharedInstance].databaseQueue;
        [queue inDatabase:^(FMDatabase *db) {
            NSString *sql = @"CREATE TABLE  if not exists \"AppList\"(\"AppName\" TEXT, \"CreateTime\" TEXT, \"AppIcon\" TEXT);";
           BOOL isSuccess = [db executeUpdate:sql];
           NSAssert(isSuccess, @"创建表失败");
            if (isSuccess) {
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tip" message:@"成功创建表" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
                    [alertView show];
                });
                
            }
        }];
    });
    
}
- (IBAction)dropOneTable:(id)sender
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        FMDatabaseQueue *queue = [MFDatabaseManager sharedInstance].databaseQueue;
        [queue inDatabase:^(FMDatabase *db) {
            NSString *sql = @"drop TABLE \"AppList\"; ";
            BOOL isSuccess = [db executeUpdate:sql];
            if (isSuccess) {
                dispatch_async(dispatch_get_main_queue(), ^(void){
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tip" message:@"成功删除表" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
                    [alertView show];
                });
                
            }
        }];
    });
}

- (IBAction)addOneRecord:(id)sender
{
    __block MFFMDBViewController *bSelf = self;
    FMDatabaseQueue *queue = [MFDatabaseManager sharedInstance].databaseQueue;
    [queue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"replace into AppList(AppName,CreateTime) values(?,?)";
        
        [db executeUpdate:sql,@"FMDB",[bSelf nowTime]];
    }];
}
- (NSString *)nowTime
{
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    NSString *date = [formatter stringFromDate:now];
    return date;
}

- (IBAction)deleteAll:(id)sender
{
    
}
@end
