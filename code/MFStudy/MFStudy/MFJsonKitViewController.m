//
//  MFJsonKitViewController.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFJsonKitViewController.h"
#import "JSONKit.h"
#import "MFEmployee.h"
#import "NSString+MD5.h"
@interface MFJsonKitViewController ()

@end

@implementation MFJsonKitViewController

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
    
    self.title = @"JSONKit";
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        MFEmployee *employee = [[MFEmployee alloc] init];
        [employee setName:[NSString stringWithFormat:@"Monkey Friend %d",i]];
        [employee setAge:20];
        
        NSDictionary *dict = [employee decodeDictionary];
        [array addObject:dict];
    }
   
    NSString *jsonStr = [array JSONString];
    NSLog(@"%@",jsonStr);
    NSLog(@"##############");
    
    NSArray *jsonArray = [jsonStr objectFromJSONString];
    for (int i = 0; i < jsonArray.count; i++) {
        NSDictionary *dict = [jsonArray objectAtIndex:i];
        NSLog(@"%@",dict);
    }
    
    
    /* md5 */
    NSString *originString = @"Monkey";
    NSLog(@"md5 : %@",[originString md5] );
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
