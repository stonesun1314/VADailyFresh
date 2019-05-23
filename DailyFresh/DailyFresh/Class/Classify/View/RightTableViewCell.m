//
//  RightTableViewCell.m
//  DailyFresh
//
//  Created by Mac on 2019/5/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "RightTableViewCell.h"

@interface RightTableViewCell ()

@end

@implementation RightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        WeakSelf
        
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"df_discover_avatar"];
        [self.contentView addSubview:_iconImageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
        _titleLabel.textColor = kUITitleColor;
        _titleLabel.text = @"爆料麻辣小龙虾";
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:12];
        _subtitleLabel.textColor = kUISubTitleColor;
        _subtitleLabel.text = @"鳃白肉嫩 收益拿起就停不下...";
        [self.contentView addSubview:_subtitleLabel];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textColor = kMainColor;
        _priceLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
        _priceLabel.text = @"￥108.00";
        [self.contentView addSubview:_priceLabel];
        
        _originPriceLabel = [[UILabel alloc] init];
        _originPriceLabel.textColor = kUIDisableTextColor;
        _originPriceLabel.text = @"￥208.00";
        _originPriceLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_originPriceLabel];
        
        _shopcartBtn = [[UIButton alloc] init];
        [_shopcartBtn setImage:[UIImage imageNamed:@"df_side_shopCar_icon"] forState:UIControlStateNormal];
        [_shopcartBtn addTarget:self action:@selector(handleAdd:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_shopcartBtn];
        
        [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(96);
            make.left.mas_equalTo(weakSelf.contentView).offset(10.f);
            make.top.mas_equalTo(weakSelf.contentView).offset(10.f);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.iconImageView.mas_right).offset(10.f);
            make.right.mas_equalTo(weakSelf.contentView).offset(-10.f);
            make.top.mas_equalTo(weakSelf.iconImageView);
            make.height.mas_equalTo(20.f);
        }];
        
        [_subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.titleLabel);
            make.right.mas_equalTo(weakSelf.contentView).offset(-10.f);
            make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom);
            make.height.mas_equalTo(35.f);
        }];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.titleLabel);
            make.top.mas_equalTo(weakSelf.subtitleLabel.mas_bottom).offset(5.f);
            make.height.mas_equalTo(20.f);
        }];
        
        [_originPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.titleLabel);
            make.top.mas_equalTo(weakSelf.priceLabel.mas_bottom);
            make.height.mas_equalTo(20.f);
        }];
        
        [_shopcartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(weakSelf.contentView).offset(-VAMargin);
            make.top.mas_equalTo(weakSelf.priceLabel);
            make.width.height.mas_equalTo(40.f);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(GoodsItemModel *)model{
    _model = model;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"df_discover_avatar"]];
    _titleLabel.text = model.name;
    _subtitleLabel.text = model.name;
    _priceLabel.text = model.price;
    _originPriceLabel.text = model.originalPrice;
}

- (void)handleAdd:(UIButton *)sender{
    if (self.addCartBlock) {
        self.addCartBlock(_model, 1);
    }
}

@end
