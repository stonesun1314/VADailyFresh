//
//  CartEmptyView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "CartEmptyView.h"

@interface CartEmptyView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CartEmptyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"df_empty_shopcar"];
        [self addSubview:_imageView];
        
        _imageView.sd_layout.widthIs(345).heightIs(200).centerXEqualToView(self).centerYEqualToView(self);
        
    }
    return self;
}

@end
