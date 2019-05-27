//
//  MinePropertySectionView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MinePropertySectionView.h"
#import "MinePropertyItemView.h"


@interface MinePropertySectionView ()

@property (nonatomic, strong) UIImageView *arcImageView;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *contentBgView;

@property (nonatomic, strong) MinePropertyItemView *balanceItem;    //余额
@property (nonatomic, strong) MinePropertyItemView *redBagItem;
@property (nonatomic, strong) MinePropertyItemView *couponItem;
@property (nonatomic, strong) MinePropertyItemView *scoreItem;


@end


@implementation MinePropertySectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        //self.backgroundColor = kUIContentBackgroundColor;
        
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI{
    _arcImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"df_mePageMaskIcon"]];
    [self addSubview:_arcImageView];
    
    _contentBgView = [[UIView alloc] init];
    _contentBgView.backgroundColor = kUIContentBackgroundColor;
    [self addSubview:_contentBgView];
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.layer.cornerRadius = 5.f;
    _contentView.clipsToBounds = YES;
    [self addSubview:_contentView];
    
    
    _arcImageView.sd_layout.leftEqualToView(self).rightEqualToView(self)
    .topEqualToView(self).heightIs(12.f);
    
    _contentBgView.sd_layout.leftSpaceToView(self, VAMargin).rightSpaceToView(self, VAMargin).topSpaceToView(_arcImageView, 0).heightIs(120.f);
    
    _contentView.sd_layout.leftSpaceToView(self, VAMargin).rightSpaceToView(self, VAMargin).topSpaceToView(_arcImageView, 0).heightIs(80.f);
    
    
    _balanceItem = [[MinePropertyItemView alloc] init];
    _balanceItem.titleLabel.text = @"￥0";
    _balanceItem.descLabel.text = @"余额";
    [_contentView addSubview:_balanceItem];
    
    _redBagItem = [[MinePropertyItemView alloc] init];
    _redBagItem.titleLabel.text = @"0";
    _redBagItem.descLabel.text = @"红包";
    [_contentView addSubview:_redBagItem];
    
    
    _couponItem = [[MinePropertyItemView alloc] init];
    _couponItem.titleLabel.text = @"0";
    _couponItem.descLabel.text = @"商品券";
    [_contentView addSubview:_couponItem];
    
    _scoreItem = [[MinePropertyItemView alloc] init];
    _scoreItem.titleLabel.text = @"0";
    _scoreItem.descLabel.text = @"积分兑换";
    [_contentView addSubview:_scoreItem];
    
    _balanceItem.sd_layout.heightIs(80);
    _redBagItem.sd_layout.heightIs(80);
    _couponItem.sd_layout.heightIs(80);
    _scoreItem.sd_layout.heightIs(80);
    
    NSArray *temp = @[_balanceItem,_redBagItem,_couponItem,_scoreItem];
    
    [_contentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:4 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    
    [self setupAutoHeightWithBottomView:_contentView bottomMargin:0.f];
}

@end
