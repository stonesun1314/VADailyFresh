//
//  MinePropertyItemView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MinePropertyItemView.h"

@interface MinePropertyItemView ()



@end

@implementation MinePropertyItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.numberOfLines = 1;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:18.f];
    [self addSubview:_titleLabel];
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:13];
    _descLabel.textColor = [UIColor darkGrayColor];
    _descLabel.numberOfLines = 1;
    _descLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_descLabel];
    
    _rightSeparatorLine = [[UIView alloc] init];
    _rightSeparatorLine.backgroundColor = kSeparatorLineColor;
    [self addSubview:_rightSeparatorLine];
    
    _titleLabel.sd_layout.centerXEqualToView(self).topSpaceToView(self, 20.f).autoWidthRatio(0).autoHeightRatio(0);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
    [_titleLabel setMaxNumberOfLinesToShow:1];
    
    _descLabel.sd_layout.centerXEqualToView(self).topSpaceToView(_titleLabel, 3.f).autoWidthRatio(0).autoHeightRatio(0);
    [_descLabel setSingleLineAutoResizeWithMaxWidth:150.f];
    [_titleLabel setMaxNumberOfLinesToShow:1];
    
    _rightSeparatorLine.sd_layout.rightEqualToView(self).widthIs(1).centerYEqualToView(self)
    .heightIs(20.f);
}

@end
