//
//  FunnyTableViewCell.m
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import "FunnyTableViewCell.h"

@implementation FunnyTableViewCell

// 实现自定义初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadViews];
    }
    return self;
}

- (void)loadViews
{
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
    [self addSubview:_contentLabel];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
