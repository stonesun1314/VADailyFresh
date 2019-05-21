//
//  DisTableHeaderView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/21.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "DisTableHeaderView.h"

@implementation DisTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = kUITitleColor;
        _titleLabel.text = @"猜你喜欢";
        [self addSubview:_titleLabel];
        
        _descLabel = [UILabel new];
        _descLabel.font = [UIFont systemFontOfSize:kUISubtitleFontSize];
        _descLabel.textColor = kUISubTitleColor;
        _descLabel.text = @"给你准备了这些，还合胃口";
        [self addSubview:_descLabel];
        
        _verSeparatorLine = [UIView new];
        _verSeparatorLine.backgroundColor = kSeparatorLineColor;
        [self addSubview:_verSeparatorLine];
        
        _titleLabel.sd_layout.leftSpaceToView(self, VAMargin).bottomSpaceToView(self, 5.f).autoHeightRatio(0);
        [_titleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
        
        _horSeparatorLine = [UIView new];
        _horSeparatorLine.backgroundColor = kSeparatorLineColor;
        [self addSubview:_horSeparatorLine];
        
        _verSeparatorLine.sd_layout.leftSpaceToView(self.titleLabel, 5.f).heightIs(15.f).bottomEqualToView(_titleLabel).widthIs(3.f);
        
        _descLabel.sd_layout.leftSpaceToView(_verSeparatorLine, 5.f).bottomEqualToView(_verSeparatorLine).autoHeightRatio(0);
        [_descLabel setSingleLineAutoResizeWithMaxWidth:200.f];
        
        _horSeparatorLine.sd_layout.leftSpaceToView(self, VAMargin).rightEqualToView(self).bottomEqualToView(self).heightIs(0.5);
    }
    return self;
}

@end
