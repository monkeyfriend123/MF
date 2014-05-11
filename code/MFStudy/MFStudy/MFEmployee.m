//
//  MFEmployee.m
//  MFStudy
//
//  Created by js on 14-5-11.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFEmployee.h"

@implementation MFEmployee
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:[NSNumber numberWithInt:self.age] forKey:@"age"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.age = [[aDecoder decodeObjectForKey:@"age"] intValue];
    return self;
}

- (NSDictionary *)decodeDictionary
{
    if (self) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:self.name forKey:@"name"];
        [dict setObject:[NSNumber numberWithInt:self.age] forKey:@"age"];
        return [dict copy];
    }
    return nil;
}
- (void)encodeFromDictionary:(NSDictionary *)dict
{
    self.name = [dict objectForKey:@"name"];
    self.age = [[dict objectForKey:@"age"] intValue];
}
@end
