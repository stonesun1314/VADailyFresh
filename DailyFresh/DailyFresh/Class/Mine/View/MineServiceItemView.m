//
//  MineServiceItemView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MineServiceItemView.h"

@implementation MineServiceItemView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textColor = [UIColor darkGrayColor];
    _titleLabel.numberOfLines = 1;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _imageView.sd_layout.centerXEqualToView(self).topSpaceToView(self, 10.f).widthIs(30.f).heightIs(30.f);
    
    _titleLabel.sd_layout.centerXEqualToView(self).topSpaceToView(_imageView, 10.f).autoWidthRatio(0).autoHeightRatio(0);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:150.f];
    [_titleLabel setMaxNumberOfLinesToShow:1];
}


@end
