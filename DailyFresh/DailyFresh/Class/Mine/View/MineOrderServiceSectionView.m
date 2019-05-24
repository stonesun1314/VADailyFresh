//
//  MineOrderServiceSectionView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MineOrderServiceSectionView.h"
#import "MineServiceItemView.h"
#import "MineOrderServiceItemView.h"

@interface MineOrderServiceSectionView ()


@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIView *serviceContentView;

@property (nonatomic, strong) MineOrderServiceItemView *prePaymentBtn;       //待付款
@property (nonatomic, strong) MineOrderServiceItemView *preSendBtn;      //待发货
@property (nonatomic, strong) MineOrderServiceItemView *sendingBtn;      //配送中
@property (nonatomic, strong) MineOrderServiceItemView *evaluateBtn;        //待评价
@property (nonatomic, strong) MineOrderServiceItemView *refundBtn;       //售后服务

@end

@implementation MineOrderServiceSectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    //df_prePayment@2x  待付款
    //df_preSend@2x 待发货
    //df_sending@2x 配送中
    //df_ic_cs_refund@2x 待评价
    //df_evaluationImage@2x //待评价
    
    _contentView = [[UIView alloc] init];
    _contentView.layer.cornerRadius = 5.f;
    _contentView.clipsToBounds = YES;
    _contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_contentView];
    
    _headerView = [[UIView alloc] init];
    [_contentView addSubview:_headerView];
    
    _titleLable = [UILabel new];
    _titleLable.textColor = [UIColor blackColor];
    _titleLable.font = [UIFont systemFontOfSize:20.f];
    _titleLable.numberOfLines = 1;
    _titleLable.text = @"我的订单";
    [_headerView addSubview:_titleLable];
    
    _moreBtn = [[UIButton alloc] init];
    _moreBtn.titleLabel.font = [UIFont systemFontOfSize:11.f];
    [_moreBtn setTitleColor:kUISubTitleColor forState:UIControlStateNormal];
    [_moreBtn setTitle:@"全部订单 >" forState:UIControlStateNormal];
    [_headerView addSubview:_moreBtn];
    
    _serviceContentView = [[UIView alloc] init];
    [_contentView addSubview:_serviceContentView];
    
    _contentView.sd_layout.leftSpaceToView(self, VAMargin).rightSpaceToView(self, VAMargin).topSpaceToView(self, 5.f);
    
    _headerView.sd_layout.leftSpaceToView(_contentView, 0).rightSpaceToView(_contentView, 0).topSpaceToView(_contentView, 0).heightIs(50.f);
    
    _serviceContentView.sd_layout.leftSpaceToView(_contentView, 0).
    rightSpaceToView(_contentView, 0).topSpaceToView(_headerView, 0).heightIs(80.f);
    
    _titleLable.sd_layout.leftSpaceToView(_headerView, 10.f).centerYEqualToView(_headerView).autoWidthRatio(0).autoHeightRatio(0);
    [_titleLable setSingleLineAutoResizeWithMaxWidth:150.f];
    [_titleLable setMaxNumberOfLinesToShow:1];
    
    _moreBtn.sd_layout.rightSpaceToView(_headerView, 10.f).centerYEqualToView(_headerView).widthIs(70.f).heightIs(40.f);
    
    _prePaymentBtn = [[MineOrderServiceItemView alloc] init];
    _prePaymentBtn.imageView.image = [UIImage imageNamed:@"df_prePayment"];
    _prePaymentBtn.titleLabel.text = @"待支付";
    [_serviceContentView addSubview:_prePaymentBtn];
    
    
    _preSendBtn = [[MineOrderServiceItemView alloc] init];
    _preSendBtn.imageView.image = [UIImage imageNamed:@"df_preSend"];
    _preSendBtn.titleLabel.text = @"待发货";
    [_serviceContentView addSubview:_preSendBtn];
    
    _sendingBtn = [[MineOrderServiceItemView alloc] init];
    _sendingBtn.imageView.image = [UIImage imageNamed:@"df_sending"];
    _sendingBtn.titleLabel.text = @"待发货";
    [_serviceContentView addSubview:_sendingBtn];
    
    
    _evaluateBtn = [[MineOrderServiceItemView alloc] init];
    _evaluateBtn.imageView.image = [UIImage imageNamed:@"df_evaluationImage"];
    _evaluateBtn.titleLabel.text = @"待评价";
    [_serviceContentView addSubview:_evaluateBtn];
    
    _refundBtn = [[MineOrderServiceItemView alloc] init];
    _refundBtn.imageView.image = [UIImage imageNamed:@"df_vending"];
    _refundBtn.titleLabel.text = @"售后/退款";
    [_serviceContentView addSubview:_refundBtn];
    
    _prePaymentBtn.sd_layout.heightIs(80.f);
    _preSendBtn.sd_layout.heightIs(80.f);
    _sendingBtn.sd_layout.heightIs(80.f);
    _evaluateBtn.sd_layout.heightIs(80.f);
    _refundBtn.sd_layout.heightIs(80.f);
    
    
    NSArray *temp = @[_prePaymentBtn,_preSendBtn,_sendingBtn,_evaluateBtn,_refundBtn];
    
    [_serviceContentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:5 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    
    [_contentView setupAutoHeightWithBottomView:_serviceContentView bottomMargin:0.f];
    
    [self setupAutoHeightWithBottomView:_contentView bottomMargin:0.f];
    
    
    //df_prePayment@2x  待付款
    //df_preSend@2x 待发货
    //df_sending@2x 配送中
    //df_vending@2x 待评价
    //df_evaluationImage@2x //待评价

}

@end
