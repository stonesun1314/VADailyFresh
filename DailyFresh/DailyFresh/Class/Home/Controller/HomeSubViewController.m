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
    self.view.backgroundColor = kMainBackgroundColor;
    
    [self setupUI];
}

- (void)setupUI{
    
    _contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_contentView];
    
    _contentView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    _headerView = [[HomeHeaderView alloc] init];
    [_contentView addSubview:_headerView];
    
    _headerView.sd_layout.leftSpaceToView(_contentView, 0).rightSpaceToView(_contentView, 0).topSpaceToView(_contentView,0.f).heightIs(530.f);
    
    HomeHorListSection *section1 = [[HomeHorListSection alloc] init];
    [_contentView addSubview:section1];
    
    NSArray * goodsItemList = [[VAMockDataSource shareInstance] homeHorGoodsItemList];
    section1.goodsItemList = goodsItemList;
    
    section1.sd_layout.leftEqualToView(section1).topSpaceToView(_headerView, 20.f).widthRatioToView(_contentView, 1.0).heightIs(220.f);
    
    
    HomeVerListSection *section2 = [[HomeVerListSection alloc] init];
    [_contentView addSubview:section2];
    
    NSArray * goodsItemList2 = [[VAMockDataSource shareInstance] homeVerGoodsItemList];
    section2.goodsItemList = goodsItemList2;
    
    section2.sd_layout.leftEqualToView(section1).topSpaceToView(section1, 20.f).widthRatioToView(_contentView, 1.0).heightIs(kVASCreenHeight);
    [_contentView setupAutoContentSizeWithBottomView:section2 bottomMargin:50.f];

    
}


@end
