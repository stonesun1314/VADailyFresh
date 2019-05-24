//
//  HomeFeatureItemView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeFeatureItemView.h"

@implementation HomeFeatureItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = kMainBackgroundColor;
        _titleLabel = [UILabel new];
        _titleLabel.textColor = kUITitleColor;
        _titleLabel.font = [UIFont systemFontOfSize:kUISubtitleFontSize];
        _titleLabel.numberOfLines = 1;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_titleLabel];
        
        _subTitleLabel = [UILabel new];
        _subTitleLabel.textColor = kUISubTitleColor;
        _subTitleLabel.font = [UIFont systemFontOfSize:11.f];
        _subTitleLabel.numberOfLines = 1;
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_subTitleLabel];
        
        _imageView1 = [[UIImageView alloc] init];
        _imageView1.layer.cornerRadius = 3.f;
        _imageView1.clipsToBounds = YES;
        [self addSubview:_imageView1];
        
        _imageView2 = [[UIImageView alloc] init];
        _imageView2.layer.cornerRadius = 3.f;
        _imageView2.clipsToBounds = YES;
        [self addSubview:_imageView2];
        
        
        _titleLabel.sd_layout.leftSpaceToView(self, 5.f).topSpaceToView(self, 2.f).autoHeightRatio(0);
        [_titleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
        [_titleLabel setMaxNumberOfLinesToShow:1];
        
        
        _subTitleLabel.sd_layout.leftEqualToView(_titleLabel).topSpaceToView(_titleLabel, 5.f).autoHeightRatio(0);
        [_subTitleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
        [_subTitleLabel setMaxNumberOfLinesToShow:1];
        
        _imageView1.sd_layout.leftEqualToView(_titleLabel).topSpaceToView(_subTitleLabel, 5.0).heightIs(60.f).widthRatioToView(self, 0.4);
        
        _imageView2.sd_layout.leftSpaceToView(_imageView1, 8).topEqualToView(_imageView1).heightIs(60.f).widthRatioToView(self, 0.4);
        
        [self setupAutoHeightWithBottomView:_imageView1 bottomMargin:0.f];
        
    }
    return self;
}

- (void)setModel:(GoodsItemModel *)model{
    _model = model;
    _titleLabel.text = model.name;
    _subTitleLabel.text = model.detail;
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:model.img]];
    [_imageView2 sd_setImageWithURL:[NSURL URLWithString:model.img]];
}

@end
