//
//  MFFirstViewController.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFListViewController.h"
#import "MFFMDBViewController.h"
@interface MFListViewController ()
@property (nonatomic, weak) IBOutlet UITableView *appListTableView;
@property (nonatomic, strong) NSMutableArray *sourceArray;
@end

@implementation MFListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _sourceArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.sourceArray addObject:@"FMDB"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *AppCell_Identity = @"AppCell_Identity";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AppCell_Identity];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:AppCell_Identity];
    }
    cell.imageView.image = [UIImage imageNamed:@"first.png"];
    cell.textLabel.text = [self.sourceArray objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            MFFMDBViewController *vc = [[MFFMDBViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        
        default:
            break;
    }
}
@end
