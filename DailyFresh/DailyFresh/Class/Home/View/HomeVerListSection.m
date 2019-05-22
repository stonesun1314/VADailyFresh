//
//  HomeVerListSection.m
//  DailyFresh
//
//  Created by Mac on 2019/5/14.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeVerListSection.h"
#import "GoodsItemModel.h"
#import "HomeVerItemCell.h"

static NSString *CellIdentiifer = @"CellIdentiifer";

@interface HomeVerListSection ()

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *contentView;

@end

@implementation HomeVerListSection

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kDarkMainBackgroundColor;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    _header = [[UIView alloc] init];
    [self addSubview:_header];
    
    _header.sd_layout.leftEqualToView(self).topEqualToView(self).heightIs(50.f).widthRatioToView(self, 1.0);
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 1;
    _titleLabel.text = @"新人首场免单";
    _titleLabel.textColor = kUITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
    [_header addSubview:_titleLabel];
    
    _titleLabel.sd_layout.leftSpaceToView(_header, VAMargin).centerYEqualToView(_header).heightIs(30.f);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:200.f];
    
    _contentView = [[UIView alloc] init];
    [self addSubview:_contentView];
    
}

- (void)setGoodsItemList:(NSArray<GoodsItemModel *> *)goodsItemList{
    _goodsItemList = goodsItemList;
    
    [self layoutGoodsItem];
}

- (void)layoutGoodsItem{
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
//        cell.backgroundColor = KColorRandomColor;
    }
    
    [_contentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:2 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:10];
    
    _contentView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(_header, 0.f).rightSpaceToView(self, 0.f);
    [self setupAutoHeightWithBottomView:_contentView bottomMargin:20.f];
}


@end
