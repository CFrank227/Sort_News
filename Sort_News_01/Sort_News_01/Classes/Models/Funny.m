//
//  Funny.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "Funny.h"

@implementation Funny

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"image"]) {
        _imageArray = value;
    }
    if ([key isEqualToString:@"special_content"]) {
        _contentArray = value;
    }
    if ([key isEqualToString:@"tags"]) {
        _tagArray = value;
    }
    if ([key isEqualToString:@"thumbnails"]) {
        _thumbnailsArray = value;
    }
    if ([key isEqualToString:@"videos"]) {
        _videoArray = value;
    }
    if ([key isEqualToString:@"summary"]) {
        self.summary = value;
    }
}



@end
