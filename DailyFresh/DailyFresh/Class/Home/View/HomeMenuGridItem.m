//
//  HomeMenuGridItem.m
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeMenuGridItem.h"

@interface HomeMenuGridItem ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

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
    _gridItemBtn.layer.cornerRadius = 5.f;
    _gridItemBtn.frame = CGRectMake(10, 5, self.bounds.size.width-20, self.bounds.size.height-25);
//    _gridItemBtn.backgroundColor = KColorRandomColor;
    
    [self addSubview:_gridItemBtn];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:10.f];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    _titleLabel.sd_layout.centerXEqualToView(_gridItemBtn).topSpaceToView(_gridItemBtn, 5.f).heightIs(15.f).widthRatioToView(_gridItemBtn, 1.0);
    
//    _gridItemBtn.sd_layout.leftEqualToView(self).rightEqualToView(self).topEqualToView(self).bottomEqualToView(self);
    
   
}

- (void)setModel:(HomeCateItemModel *)model{
    _model = model;
    [_gridItemBtn sd_setImageWithURL:[NSURL URLWithString:model.img] forState:UIControlStateNormal];
    //[_gridItemBtn setImage:[UIImage imageNamed:@"df_newHomeRecommendShopCartImage"] forState:UIControlStateNormal];
//    [_gridItemBtn setTitle:model.name forState:UIControlStateNormal];
    _titleLabel.text = model.name;
//    [_gridItemBtn SG_imagePositionStyle:(SGImagePositionStyleTop) spacing:10.f];
}

@end
