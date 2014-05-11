//
//  MFAFNetworkViewController.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFAFNetworkViewController.h"

#import "MFAFTableCell.h"
@interface MFAFNetworkViewController ()<UITableViewDataSource>
//图片地址
@property (nonatomic, strong) NSMutableArray *imageUrlArray;
@end

@implementation MFAFNetworkViewController

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
    self.title = @"AFNetwork";
    [self initImageUrlArray];
    
}
- (void)initImageUrlArray
{
    self.imageUrlArray = [[NSMutableArray alloc] init];
    
    [self.imageUrlArray addObject:@"http://www.objc.io/images/covers/12.jpg"];
    
    [self.imageUrlArray addObject:@"http://e.hiphotos.baidu.com/image/pic/item/80cb39dbb6fd5266c40ccf15a918972bd407368f.jpg"];
    [self.imageUrlArray addObject:@"http://c.hiphotos.baidu.com/image/pic/item/6c224f4a20a446237be457639a22720e0cf3d781.jpg"];
    [self.imageUrlArray addObject:@"http://c.hiphotos.baidu.com/image/pic/item/34fae6cd7b899e512d79ce1540a7d933c8950d3f.jpg"];
    [self.imageUrlArray addObject:@"http://h.hiphotos.baidu.com/image/pic/item/ac345982b2b7d0a2a30d8e90c9ef76094a369af3.jpg"];
    [self.imageUrlArray addObject:@"http://c.hiphotos.baidu.com/image/pic/item/0bd162d9f2d3572cd38bcade8813632762d0c343.jpg"];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageUrlArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MFCellIdentity = @"MFAFTableCell";
    MFAFTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MFCellIdentity];
    if (!cell) {
        cell = [[MFAFTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MFCellIdentity];
    }
    [cell reloadWithUrlString:self.imageUrlArray[indexPath.row]];
    return cell;
}
@end
