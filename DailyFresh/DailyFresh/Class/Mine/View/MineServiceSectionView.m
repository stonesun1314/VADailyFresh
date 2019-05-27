//
//  MineServiceSectionView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MineServiceSectionView.h"
#import "MineItemModel.h"
#import "MineServiceItemView.h"

@interface MineServiceSectionView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIView *serviceContentView;

@property (nonatomic, strong) NSArray *dataList;

@end

@implementation MineServiceSectionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDataSource];
        [self setupUI];
    }
    return self;
}

- (void)initDataSource {
    
    MineItemModel *model1 = [MineItemModel new];
    model1.img = @"df_prePayment";
    model1.name = @"储值送会员";
    
    MineItemModel *model2 = [MineItemModel new];
    model2.img = @"df_preSend";
    model2.name = @"签到";
    
    MineItemModel *model3 = [MineItemModel new];
    model3.img = @"df_sending";
    model3.name = @"我的拼团";
    
    MineItemModel *model4 = [MineItemModel new];
    model4.img = @"df_evaluationImage";
    model4.name = @"推荐有礼";
    
    MineItemModel *model5 = [MineItemModel new];
    model5.img = @"df_vending";
    model5.name = @"积分商城";
    
    MineItemModel *model6 = [MineItemModel new];
    model6.img = @"df_prePayment";
    model6.name = @"邀请得红包";
    
    MineItemModel *model7 = [MineItemModel new];
    model7.img = @"df_preSend";
    model7.name = @"收货地址";
    
    MineItemModel *model8 = [MineItemModel new];
    model8.img = @"df_sending";
    model8.name = @"客服和帮助";
    
    MineItemModel *model9 = [MineItemModel new];
    model9.img = @"df_evaluationImage";
    model9.name = @"设置";
    
    
    
    _dataList = @[model1,model2,model3,model4,model5,model6,model7,model8,model9];
    //df_prePayment@2x  待付款
    //df_preSend@2x 待发货
    //df_sending@2x 配送中
    //df_vending@2x 待评价
    //df_evaluationImage@2x //待评价
    
}

- (void)setupUI{
    
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
    _titleLable.text = @"我的服务";
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
    rightSpaceToView(_contentView, 0).topSpaceToView(_headerView, 0);
    
    _titleLable.sd_layout.leftSpaceToView(_headerView, 10.f).centerYEqualToView(_headerView).autoWidthRatio(0).autoHeightRatio(0);
    [_titleLable setSingleLineAutoResizeWithMaxWidth:150.f];
    [_titleLable setMaxNumberOfLinesToShow:1];
    
    _moreBtn.sd_layout.rightSpaceToView(_headerView, 10.f).centerYEqualToView(_headerView).widthIs(70.f).heightIs(40.f);
    

    NSMutableArray *temp = [NSMutableArray new];
    for (MineItemModel *model in _dataList) {
        NSInteger index = [_dataList indexOfObject:model];
        MineServiceItemView *item = [[MineServiceItemView alloc] init];
        item.tag = index;
        item.imageView.image = [UIImage imageNamed:model.img];
        item.titleLabel.text = model.name;
        [_serviceContentView addSubview:item];
        [temp addObject:item];
        
        item.sd_layout.heightIs(80.f);
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleItem:)];
        [item addGestureRecognizer:gesture];
    }
    
   
    
    [_serviceContentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:0 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
    
    [_contentView setupAutoHeightWithBottomView:_serviceContentView bottomMargin:0.f];
    
    [self setupAutoHeightWithBottomView:_contentView bottomMargin:0.f];
    
    
    //df_prePayment@2x  待付款
    //df_preSend@2x 待发货
    //df_sending@2x 配送中
    //df_ic_cs_refund@2x 待评价
    //df_evaluationImage@2x //待评价
    
}

- (void)handleItem:(UIGestureRecognizer *)sender {
    UIView *view = sender.view;
    if (self.serviceItemBlock) {
        self.serviceItemBlock(view.tag);
    }
}


@end
