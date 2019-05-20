//
//  HomeSubViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeSubViewController.h"
#import "HomeHeaderView.h"
#import "HomeHorListView.h"
#import "HomeVerListView.h"
#import "HomeHorListSection.h"
#import "HomeVerListSection.h"


@interface HomeSubViewController ()

@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) HomeHeaderView *headerView;
@property (nonatomic, strong) HomeHorListView *horListView;
@property (nonatomic, strong) HomeVerListView *verListView;

@end

@implementation HomeSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kUIContentBackgroundColor;
    
    [self setupUI];
}

- (void)setupUI{
    
    _contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _contentView.backgroundColor = kUIContentBackgroundColor;
    [self.view addSubview:_contentView];
    
    WeakSelf
    _contentView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.contentView.mj_header endRefreshing];
        });
    }];
    _contentView.mj_header.automaticallyChangeAlpha = YES;
    
    _contentView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    _headerView = [[HomeHeaderView alloc] init];
    [_contentView addSubview:_headerView];
    
    _headerView.sd_layout.leftSpaceToView(_contentView, 0).rightSpaceToView(_contentView, 0).topSpaceToView(_contentView,0.f);
    
    HomeHorListSection *section1 = [[HomeHorListSection alloc] initWithType:HomeHorListTypeTitle];
    
    [_contentView addSubview:section1];
    
    NSArray * goodsItemList = [[VAMockDataSource shareInstance] homeHorGoodsItemList];
    section1.goodsItemList = goodsItemList;
    
   
    
    HomeHorListSection *section11 = [[HomeHorListSection alloc] initWithType:HomeHorListTypeTopAd];
    [_contentView addSubview:section11];

    NSArray * goodsItemList11 = [[VAMockDataSource shareInstance] homeHorGoodsItemList];
    section11.goodsItemList = goodsItemList11;

    
    HomeVerListSection *section2 = [[HomeVerListSection alloc] init];
    
    [_contentView addSubview:section2];
    
    section2.goodsItemList = self.verGoodsItemList;
    
    section1.sd_layout.leftEqualToView(_contentView).topSpaceToView(_headerView, 10.f).widthRatioToView(_contentView, 1.0);
    section11.sd_layout.leftEqualToView(_contentView).topSpaceToView(section1, 10.f).widthRatioToView(_contentView, 1.0);
    section2.sd_layout.leftEqualToView(section11).topSpaceToView(section11, 10.f).widthRatioToView(_contentView, 1.0);
    [_contentView setupAutoContentSizeWithBottomView:section2 bottomMargin:20.f];
}


@end
