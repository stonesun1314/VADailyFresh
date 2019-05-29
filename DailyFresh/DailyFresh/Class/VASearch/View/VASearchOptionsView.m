//
//  VASearchOptionsView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/29.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VASearchOptionsView.h"

@interface VASearchOptionsView ()

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *contentView;

@end

@implementation VASearchOptionsView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initDataSource];
        [self setupUI];
    }
    return self;
}

- (void)initDataSource{
    _dataSource = @[@"平价菜",@"酸奶",@"小龙虾",@"雪糕",@"榴莲",@"牛奶",@"榴莲",@"牛奶",@"榴莲",@"牛奶",@"平价菜",@"酸奶",@"小龙虾",@"雪糕",@"榴莲",@"牛奶"];
}

- (void)setupUI{
    _headerView = [[UIView alloc] init];
    [self addSubview:_headerView];
    
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.numberOfLines = 1;
    _titleLabel.text = @"热门搜索";
    _titleLabel.textColor = kUITitleColor;
    _titleLabel.font = [UIFont systemFontOfSize:kUITitleFontsize];
    [_headerView addSubview:_titleLabel];
    
    _titleLabel.sd_layout.leftSpaceToView(_headerView, VAMargin).centerYEqualToView(_headerView).heightIs(30.f);
    [_titleLabel setSingleLineAutoResizeWithMaxWidth:200.f];
    
    self.contentView = [[UIView alloc] init];
    [self addSubview:self.contentView];
    
    _headerView.sd_layout.leftEqualToView(self).topEqualToView(self).heightIs(50.f).widthRatioToView(self, 1.0);
    _contentView.sd_layout.leftEqualToView(self).topSpaceToView(_headerView, 0.f).widthRatioToView(self, 1.0);
    [_headerView updateLayout];
    [_contentView updateLayout];
    [self updateLayout];
    
}

- (void)reloadData{
    [self layoutItems];
}

- (void)layoutItems{
    
    
    UIView *lastView = _contentView;
    for (NSString *text in _dataSource) {
        UIButton *btn = [[UIButton alloc] init];
        btn.layer.borderColor = kSeparatorLineColor.CGColor;
        btn.layer.borderWidth = 0.5;
        btn.layer.cornerRadius = 3.f;
        btn.clipsToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [btn setTitle:text forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_contentView addSubview:btn];
        
        [btn addTarget:self action:@selector(handleItem:) forControlEvents:UIControlEventTouchUpInside];
    
        
        btn.sd_layout.leftSpaceToView(lastView, 10.f).topEqualToView(lastView);
        [btn setupAutoSizeWithHorizontalPadding:10.f buttonHeight:30.f];
        
        [btn updateLayout];
        
        if (CGRectGetMaxX(btn.frame) > (_contentView.width - 10.f)){
            btn.sd_resetLayout.leftSpaceToView(_contentView, 10.f).topSpaceToView(lastView, 10.f);
            [btn setupAutoSizeWithHorizontalPadding:10.f buttonHeight:30.f];
        }

        lastView = btn;
    }
    
    [_contentView setupAutoHeightWithBottomView:lastView bottomMargin:20.f];
    
}

- (void)handleItem:(UIButton *)sender {
    
    if (self.selectItemBlock) {
        self.selectItemBlock(sender.currentTitle);
    }
}



@end
