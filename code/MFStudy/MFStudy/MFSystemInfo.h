//
//  MFSystemInfo.h
//  MFStudy
//  这是一个系统工具类， 与系统相关的方法写在这里
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFSystemInfo : NSObject

/**
 *  获取程序的版本
 *
 *  @return versionno 字符串
 */
+ (NSString *)softwareVersion;
@end
