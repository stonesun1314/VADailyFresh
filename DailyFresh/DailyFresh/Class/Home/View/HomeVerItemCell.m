//
//  HomeVerItemCell.m
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeVerItemCell.h"

@interface HomeVerItemCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *originPriceLabel;
@property (nonatomic, strong) UIButton *shopcartBtn;

@end

@implementation HomeVerItemCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //        self.layer.cornerRadius = 10.f;
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 10.f;
        [self setupView];
    }
    return self;
    
}

-(void)setupView {
    
    // 这里用来初始化子控件
    _imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
    
    _imageView.sd_layout.centerXEqualToView(self).topSpaceToView(self, 5.f).widthIs(140.f).heightIs(140.f);
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
    _titleLabel.textColor = kUITitleColor;
    [self addSubview:_titleLabel];
    
    _titleLabel.sd_layout.leftEqualToView(_imageView).topSpaceToView(_imageView, 5.f).heightIs(25.f).rightEqualToView(_imageView);
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.textColor = kMainColor;
    _priceLabel.font = [UIFont systemFontOfSize:14.f];
    [self addSubview:_priceLabel];
    
    _originPriceLabel = [[UILabel alloc] init];
    _originPriceLabel.textColor = kUISubTitleColor;
    _originPriceLabel.font = [UIFont systemFontOfSize:12.f];
    [self addSubview:_originPriceLabel];
    
    
    _shopcartBtn = [[UIButton alloc] init];
    [_shopcartBtn setImage:[UIImage imageNamed:@"df_buy_button"] forState:UIControlStateNormal];
    [_shopcartBtn addTarget:self action:@selector(handleAddCart:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_shopcartBtn];
    
    _priceLabel.sd_layout.leftEqualToView(_imageView).topSpaceToView(_titleLabel, 5.f).heightIs(20.f);
    _originPriceLabel.sd_layout.leftEqualToView(_priceLabel).topSpaceToView(_priceLabel, 0.0f).heightIs(15.f);
    
    [_priceLabel setSingleLineAutoResizeWithMaxWidth:100.f];
    [_originPriceLabel setSingleLineAutoResizeWithMaxWidth:100.f];
    
    _shopcartBtn.sd_layout.topEqualToView(_priceLabel).rightEqualToView(_imageView).widthIs(50.f).heightIs(50.f);
    
    
    
}

- (void)setModel:(GoodsItemModel *)model{
    _model = model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"df_discover_avatar"]];
    _titleLabel.text = model.name;
    _priceLabel.text = model.price;
    _originPriceLabel.text = model.originalPrice;
}

- (void)handleAddCart:(UIButton *)sender {
    if (self.addCartBlock) {
        self.addCartBlock(_model, 1);
    }
}

@end
