//
//  CartSettlingView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "CartSettlingView.h"

@interface CartSettlingView ()

@property (nonatomic, strong) UIButton *selectAllBtn;

@property (nonatomic, strong) UILabel *totalPriceLabel;

@property (nonatomic, strong) UIButton *settleBtn;  //结算按钮


@end

@implementation CartSettlingView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = kMainBackgroundColor;
        
        _selectAllBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
        [_selectAllBtn setImage:[UIImage imageNamed:@"df_billNoSelectImage"] forState:UIControlStateNormal];
        [_selectAllBtn setImage:[UIImage imageNamed:@"df_billSelectImage"] forState:UIControlStateSelected];
        [_selectAllBtn addTarget:self action:@selector(handleSelectAll:) forControlEvents:UIControlEventTouchUpInside];
        [_selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
        _selectAllBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_selectAllBtn setTitleColor:kUITitleColor forState:UIControlStateNormal];
        [self addSubview:_selectAllBtn];
        
        [_selectAllBtn SG_imagePositionStyle:SGImagePositionStyleDefault spacing:5.f];
        
        _totalPriceLabel = [UILabel new];
        _totalPriceLabel.textColor = [UIColor blackColor];
        _totalPriceLabel.text = @"合计: ￥0.00";
        _totalPriceLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
        _totalPriceLabel.numberOfLines = 1;
        [self addSubview:_totalPriceLabel];
        
        _settleBtn = [[UIButton alloc] init];
        [_settleBtn setTitle:@"去结算" forState:UIControlStateNormal];
        _settleBtn.backgroundColor = kMainColor;
        [_settleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_settleBtn addTarget:self action:@selector(handleSettle:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_settleBtn];
        
        _selectAllBtn.sd_layout.leftSpaceToView(self, VAMargin).centerYEqualToView(self).widthIs(80).heightIs(44);
        _settleBtn.sd_layout.topEqualToView(self).heightRatioToView(self, 1.0).rightEqualToView(self).widthIs(100.f);
        _totalPriceLabel.sd_layout.rightSpaceToView(_settleBtn, 5.f).autoWidthRatio(0).centerYEqualToView(self).autoHeightRatio(0);
         [_totalPriceLabel setMaxNumberOfLinesToShow:1];
        [_totalPriceLabel setSingleLineAutoResizeWithMaxWidth:200.f];
       
        
    }
    return self;
}

- (void)handleSelectAll:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.selectAllBlock) {
        self.selectAllBlock(sender.selected);
    }
}

- (void)handleSettle:(UIButton *)sender {
    
}

- (void)setTotalPrice:(NSString *)totalPrice{
    _totalPrice = totalPrice;
    _totalPriceLabel.text = [VANStringUtil converCurrnecyFormate:_totalPrice];
}

@end
