//
//  CartTableViewCell.m
//  DailyFresh
//
//  Created by Mac on 2019/5/21.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "CartTableViewCell.h"


@interface CartTableViewCell ()

@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UIImageView *adImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *originPriceLabel;

@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation CartTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupView];
    }
    return self;
}

- (void)setupView{
    _selectBtn = [[UIButton alloc] init];
    [_selectBtn setImage:[UIImage imageNamed:@"df_billNoSelectImage"] forState:UIControlStateNormal];
    [_selectBtn setImage:[UIImage imageNamed:@"df_billSelectImage"] forState:UIControlStateSelected];
    [_selectBtn addTarget:self action:@selector(handleSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_selectBtn];
    
    _adImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_adImageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.numberOfLines = 1;
    _titleLabel.textColor = kUITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
    
    _priceLabel = [UILabel new];
    _priceLabel.textColor = kMainColor;
    _priceLabel.font = [UIFont systemFontOfSize:17.f];
    [self.contentView addSubview:_priceLabel];
    
    _originPriceLabel = [UILabel new];
    _originPriceLabel.textColor = kUISubTitleColor;
    _originPriceLabel.font = [UIFont systemFontOfSize:12.f];
    [self.contentView addSubview:_originPriceLabel];
    
    _addBtn = [[UIButton alloc] init];
    [_addBtn setImage:[UIImage imageNamed:@"df_home_add_cart_add_normal"] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(handleAdd:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_addBtn];
    
    _subBtn = [[UIButton alloc] init];
    [_subBtn setImage:[UIImage imageNamed:@"df_home_add_cart_sub_normal"] forState:UIControlStateNormal];
    [_subBtn addTarget:self action:@selector(handleSub:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_subBtn];
    
    _countLabel = [UILabel new];
    _countLabel.textAlignment = NSTextAlignmentCenter;
    _countLabel.font = [UIFont systemFontOfSize:14.f];
    _countLabel.textColor = kUITitleColor;//kUITitleColor;
    [self.contentView addSubview:_countLabel];
    
    _selectBtn.sd_layout.leftSpaceToView(self.contentView, VAMargin).centerYEqualToView(self.contentView).widthIs(44).heightIs(44.f);
    _adImageView.sd_layout.leftSpaceToView(_selectBtn, 3.f).widthIs(80).heightIs(80.f).centerYEqualToView(self.contentView);
    _titleLabel.sd_layout.leftSpaceToView(self.adImageView, 5.f).topEqualToView(self.adImageView).rightSpaceToView(self.contentView, VAMargin).heightIs(20.f);
//    [_titleLabel setSingleLineAutoResizeWithMaxWidth:300.f];
    
    _priceLabel.sd_layout.leftEqualToView(self.titleLabel).topSpaceToView(self.titleLabel, 35.f).autoWidthRatio(0).autoHeightRatio(0);
    [_priceLabel setSingleLineAutoResizeWithMaxWidth:150.f];
    
    [_priceLabel updateLayout];
    
    _originPriceLabel.sd_layout.leftSpaceToView(self.priceLabel, 5.f).bottomEqualToView(self.priceLabel).autoWidthRatio(0).autoHeightRatio(0);
    [_originPriceLabel setSingleLineAutoResizeWithMaxWidth:150.f];
    
    
    _addBtn.sd_layout.rightSpaceToView(self.contentView, VAMargin).centerYEqualToView(self.priceLabel).widthIs(42).heightIs(42.f);
    _countLabel.sd_layout.centerYEqualToView(self.addBtn).widthIs(15.f).rightSpaceToView(self.addBtn, 0.f).autoHeightRatio(0);
    _subBtn.sd_layout.centerYEqualToView(self.addBtn).rightSpaceToView(_countLabel, 0).widthIs(42).heightIs(42.);
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(CartGoodsItemModel *)model{
    _model = model;
    
    [_adImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    _titleLabel.text = model.name;
    _priceLabel.text = [VANStringUtil converCurrnecyFormate:model.price]; //model.price;
    _originPriceLabel.text = [VANStringUtil converCurrnecyFormate:model.originalPrice]; //model.originalPrice;
    _countLabel.text = [model.goodsNum stringValue];
    _selectBtn.selected = model.selected;
    
//    [_adImageView sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557829191471&di=5caab1d3fabef9308ce19100c8cbf3ec&imgtype=0&src=http%3A%2F%2Fpic21.nipic.com%2F20120606%2F9801164_164114621166_2.jpg"]];
//    _titleLabel.text = @"商品名称";
//    _priceLabel.text = @"1200";
//    _originPriceLabel.text = @"1500";
//    _countLabel.text = @"12";
//    _selectBtn.selected = model.selected;
}

- (void)handleSelect:(UIButton *)sender {
    sender.selected = !sender.selected;
    _model.selected = sender.selected;
    if (self.cellSelectedBlock) {
        self.cellSelectedBlock(_model.selected);
    }
}

- (void)handleAdd:(UIButton *)sender {
    
    NSInteger count = [_model.goodsNum integerValue];
    count++;
    _model.goodsNum = [NSNumber numberWithInteger:count];
    _countLabel.text = [_model.goodsNum stringValue];
    if (self.addCartBlock) {
        self.addCartBlock(_model,1);
    }
}

- (void)handleSub:(UIButton *)sender {
    NSInteger count = [_model.goodsNum integerValue];
    if (count <= 0) {
        return;
    }
    count--;
    
    _model.goodsNum = [NSNumber numberWithInteger:count];
    _countLabel.text = [_model.goodsNum stringValue];
    if (self.subCartBlock) {
        self.subCartBlock(_model,1);
    }
}

@end
