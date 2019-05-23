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
        _subTitleLabel.font = [UIFont systemFontOfSize:12.f];
        _subTitleLabel.numberOfLines = 1;
        _subTitleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_subTitleLabel];
        
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.cornerRadius = 3.f;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        
        _titleLabel.sd_layout.leftSpaceToView(self, 5.f).topSpaceToView(self, 5.f).autoHeightRatio(0);
        [_titleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
        [_titleLabel setMaxNumberOfLinesToShow:1];
        
        
        _subTitleLabel.sd_layout.leftEqualToView(_titleLabel).topSpaceToView(_titleLabel, 2.f).autoHeightRatio(0);
        [_subTitleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
        [_subTitleLabel setMaxNumberOfLinesToShow:1];
        
        _imageView.sd_layout.leftEqualToView(_titleLabel).topSpaceToView(_subTitleLabel, 5.0).heightIs(80.f).rightSpaceToView(self,10.f);
        
        [self setupAutoHeightWithBottomView:_imageView bottomMargin:0.f];
        
    }
    return self;
}

- (void)setModel:(GoodsItemModel *)model{
    _model = model;
    _titleLabel.text = model.name;
    _subTitleLabel.text = model.detail;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
}

@end
