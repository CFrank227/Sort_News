//
//  Funny.h
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Funny : NSObject
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *attribute;
@property (nonatomic, copy) NSString *card_content_type;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *comment_cnt;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *content_length;
@property (nonatomic, copy) NSString *content_type;
@property (nonatomic, copy) NSString *grab_time;
@property (nonatomic, copy) NSString *rticle_id;
@property (nonatomic, copy) NSString *item_type;
@property (nonatomic, copy) NSString *matched_tag;
@property (nonatomic, copy) NSString *oppose_cnt;
@property (nonatomic, copy) NSString *original_url;
@property (nonatomic, copy) NSString *publish_time;
@property (nonatomic, copy) NSString *reco_type;
@property (nonatomic, copy) NSString *recoid;
@property (nonatomic, copy) NSString *site;
@property (nonatomic, copy) NSString *source_name;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *support_cnt;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *valid;
@property (nonatomic, copy) NSString *view_cnt;


@property (nonatomic, retain) NSArray *videoArray;
@property (nonatomic, retain) NSArray *thumbnailsArray;
@property (nonatomic, retain) NSArray *tagArray;
@property (nonatomic, retain) NSArray *contentArray;
@property (nonatomic, retain) NSArray *imageArray;

@end
