//
//  MFSystemInfo.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFSystemInfo.h"

@implementation MFSystemInfo
+ (NSString *)softwareVersion
{
   NSString *softwareVersionNo = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"%@",softwareVersionNo];
}
@end
