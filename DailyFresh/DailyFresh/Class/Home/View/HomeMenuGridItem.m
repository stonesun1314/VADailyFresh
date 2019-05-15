//
//  HomeMenuGridItem.m
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeMenuGridItem.h"

@implementation HomeMenuGridItem

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}


- (void)setupUI{
    _gridItemBtn = [[UIButton alloc] initWithFrame:self.bounds];
    _gridItemBtn.titleLabel.font = [UIFont systemFontOfSize:9.f];
    [_gridItemBtn setTitleColor:kUITitleColor forState:UIControlStateNormal];
//    _gridItemBtn.backgroundColor = KColorRandomColor;
    
    [self addSubview:_gridItemBtn];
    
//    _gridItemBtn.sd_layout.leftEqualToView(self).rightEqualToView(self).topEqualToView(self).bottomEqualToView(self);
    
   
}

- (void)setModel:(HomeCateItemModel *)model{
    _model = model;
    [_gridItemBtn setImage:[UIImage imageNamed:@"df_newHomeRecommendShopCartImage"] forState:UIControlStateNormal];
    [_gridItemBtn setTitle:model.name forState:UIControlStateNormal];
    [_gridItemBtn SG_imagePositionStyle:(SGImagePositionStyleTop) spacing:10.f];
}

@end
