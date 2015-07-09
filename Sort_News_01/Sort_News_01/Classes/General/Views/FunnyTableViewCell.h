//
//  FunnyTableViewCell.h
//  Sort_News_01
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunnyTableViewCell : UITableViewCell

@property (nonatomic, retain) UILabel *contentLabel;

// 自定义初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
