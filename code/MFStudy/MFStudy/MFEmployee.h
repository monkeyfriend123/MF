//
//  MFEmployee.h
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFEmployee : NSObject<NSCoding>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;

- (NSDictionary *)decodeDictionary;
- (void)encodeFromDictionary:(NSDictionary *)dict;
@end
