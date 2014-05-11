//
//  MFSecondViewController.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFAboutViewController.h"

@interface MFAboutViewController ()
/* 显示版本值 */
@property (nonatomic, weak) IBOutlet UILabel *softwareVersionLabel;
@end

@implementation MFAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)updateView
{
    self.softwareVersionLabel.text = [MFSystemInfo softwareVersion ];
}
@end
