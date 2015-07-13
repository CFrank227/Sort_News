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
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 360, 160)];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:_contentLabel];
    
    // self.frame.size.height - 20
    self.backgroundColor = [UIColor cyanColor];
    self.logoLabel =[[UILabel alloc] initWithFrame:CGRectMake(self.contentLabel.bounds.size.width - 80 , self.contentLabel.bounds.size.height , 77, 15)];
//    self.logoLabel.backgroundColor = [UIColor redColor];
    self.logoLabel.textColor = [UIColor lightGrayColor];
    
    
    _logoLabel.text = @"糗事百科";
    [self addSubview:_logoLabel];
}


/*
//- (void)setContentLabelText:(NSString *)text
//{
//    //获得当前cell高度
//    CGRect frame = [self frame];
//        //文本赋值
//        self.contentLabel.text = text;
//        //设置label的最大行数
//        self.contentLabel.numberOfLines = 10;
//        CGSize size = CGSizeMake(300, 1000);
//        CGSize labelSize = [self.contentLabel.text sizeWithFont:self.contentLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
//        self.contentLabel.frame = CGRectMake(self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, labelSize.width, labelSize.height);
//    
//        //计算出自适应的高度
//        frame.size.height = labelSize.height+100;
//        
//        self.frame = frame;
//
//}
 */

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
