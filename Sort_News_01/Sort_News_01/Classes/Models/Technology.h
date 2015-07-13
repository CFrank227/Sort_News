//
//  Technology.h
//  Sort_News_01
//
//  Created by lanou3g on 15/7/10.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Technology : NSObject


@property (nonatomic, copy) NSString *banner;
@property (nonatomic, copy) NSString *article;
@property (nonatomic, copy) NSString *card;



@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSString *card_content_type;
@property (nonatomic, copy) NSString *card_id;
@property (nonatomic, assign) NSInteger cid;
@property (nonatomic, copy) NSString *comment_cnt;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) CGFloat  content_length;
@property (nonatomic, copy) NSString *content_type;
@property (nonatomic, assign) NSInteger grab_time;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) UIImage *image;
@property (nonatomic, copy) NSString *item_type;
@property (nonatomic, copy) NSString *matched_tag;
@property (nonatomic, copy) NSString *oppose_cnt;
@property (nonatomic, copy) NSString *original_url;
@property (nonatomic, assign) NSInteger publish_time;
@property (nonatomic, copy) NSString *reco_type;
@property (nonatomic, copy) NSString *recoid;
@property (nonatomic, copy) NSString *site;
@property (nonatomic, copy) NSString *source_name;
@property (nonatomic, copy) NSString *special_content;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *support_cnt;
@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSArray *thumbnails;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *valid;
@property (nonatomic, copy) NSArray *videos;
@property (nonatomic, copy) NSString *view_cnt;
@end
