//
//  Technology.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/10.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "Technology.h"

@implementation Technology


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}

@end
