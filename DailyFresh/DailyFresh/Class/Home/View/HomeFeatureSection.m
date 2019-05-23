//
//  HomeFeatureSection.m
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeFeatureSection.h"
#import "HomeFeatureItemView.h"

@interface HomeFeatureSection ()

@property (nonatomic, strong) UIView *header;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation HomeFeatureSection

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _header = [[UIView alloc] init];
    [self addSubview:_header];
    
    
    _header.sd_layout.leftEqualToView(self).topEqualToView(self).widthRatioToView(self, 1.0).heightIs(40.f);
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 1;
    _titleLabel.text = @"特色专区";
    _titleLabel.textColor = kUITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
    [_header addSubview:_titleLabel];
    
    //    _titleLabel.backgroundColor = [UIColor orangeColor];
    
    _titleLabel.sd_layout.leftSpaceToView(_header, VAMargin).centerYEqualToView(_header).heightIs(30.f);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:200.f];

    _contentView = [UIView new];
    
    [self addSubview:_contentView];
    
    _contentView.sd_layout.leftEqualToView(self).rightEqualToView(self).topSpaceToView(_titleLabel, 3.f);
}

- (void)setModel:(HomeFeatureSectionModel *)model{
    _model = model;
    
    [self layoutItems];
}

- (void)layoutItems {
    [_contentView removeAllSubviews];
    
    NSMutableArray *temp = [NSMutableArray new];
    
    CGSize size = CGSizeMake((kScreenSize.width - VAMargin * 2)/2, 240.f);
    for (GoodsItemModel *model  in _model.subItem) {
        HomeFeatureItemView *cell = [[HomeFeatureItemView alloc] init];
        cell.model = model;
        
        [_contentView addSubview:cell];
        [temp addObject:cell];
        cell.sd_layout.heightIs(size.height);
//        cell.backgroundColor = KColorRandomColor;
    }
    
    [_contentView updateLayout];
    
    [_contentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:2 verticalMargin:5 horizontalMargin:5 verticalEdgeInset:5 horizontalEdgeInset:10];

    [self setupAutoHeightWithBottomView:_contentView bottomMargin:20.f];
    
    [_contentView updateLayout];
    [self updateLayout];
    VALog(@"%@",_contentView);
    VALog(@"%@",self);

}

@end
