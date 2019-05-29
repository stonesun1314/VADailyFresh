//
//  VASearchGoodsItemListView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/29.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VASearchGoodsItemListView.h"
#import "GoodsItemModel.h"
#import "HomeVerItemCell.h"

@interface VASearchGoodsItemListView ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation VASearchGoodsItemListView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kUIContentBackgroundColor;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    
    self.contentView = [[UIView alloc] init];
    [self addSubview:self.contentView];
    
    _contentView.sd_resetLayout.leftEqualToView(self).topSpaceToView(self, 0.f).widthRatioToView(self, 1.0);

    [_contentView updateLayout];
    [self updateLayout];
    

}

- (void)setGoodsItemList:(NSArray<GoodsItemModel *> *)goodsItemList{
    _goodsItemList = goodsItemList;
    
    [self layoutGoodsItem];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)layoutGoodsItem{
    
    [_contentView removeAllSubviews];
    
    NSMutableArray *temp = [NSMutableArray new];
    
    CGSize size = CGSizeMake((kScreenSize.width - VAMargin * 2)/2, 240.f);
    for (GoodsItemModel *model  in _goodsItemList) {
        HomeVerItemCell *cell = [[HomeVerItemCell alloc] init];
        cell.model = model;
        
        cell.addCartBlock = ^(GoodsItemModel *model, NSInteger num) {
            [[VAMockDataSource shareInstance] addShoppingCart:model];
        };
        
        [_contentView addSubview:cell];
        [temp addObject:cell];
        cell.sd_layout.heightIs(size.height);

    }
    
    [_contentView updateLayout];
    
    [_contentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:2 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:10];
    
    
    [self setupAutoHeightWithBottomView:_contentView bottomMargin:20.f];
    //    _contentView.backgroundColor = [UIColor redColor];
    //    [_contentView updateLayout];
    //    [self updateLayout];
    
    //    VALog(@"%@",_contentView);
}

@end
