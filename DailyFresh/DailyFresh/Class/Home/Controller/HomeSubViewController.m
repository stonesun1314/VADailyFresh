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
    VAMJRefreshGifHeader *header = [VAMJRefreshGifHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.contentView.mj_header endRefreshing];
            
        });
    }];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    [header beginRefreshing];
    
    _contentView.mj_header = header;
    
    UIView *lastObj;
    

    _contentView.mj_header.automaticallyChangeAlpha = YES;
    
    _contentView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    _headerView = [[HomeHeaderView alloc] init];
    _headerView.cateModel = _cateSectionModel;
    [_contentView addSubview:_headerView];
    
    _headerView.sd_layout.leftSpaceToView(_contentView, 0).rightSpaceToView(_contentView, 0).topSpaceToView(_contentView,0.f);
    
    lastObj = _headerView;
    
    if (_limTimeModel) {
        HomeHorListSection *section1 = [[HomeHorListSection alloc] initWithType:HomeHorListTypeTitle];
        
        [_contentView addSubview:section1];
        
        section1.name = _limTimeModel.name;
        section1.goodsItemList = _limTimeModel.subItem;
        
        section1.sd_layout.leftEqualToView(_contentView).topSpaceToView(_headerView, 10.f).widthRatioToView(_contentView, 1.0);
        
        lastObj = section1;
    }

    
    if (_topAdModelArr.count > 0) {
        
        for (HomeTopAdSectionModel *model in _topAdModelArr) {
            HomeHorListSection *section11 = [[HomeHorListSection alloc] initWithType:HomeHorListTypeTopAd];
            [_contentView addSubview:section11];
            
            section11.topAdImg = model.img;
            section11.goodsItemList = model.subItem;
            section11.sd_layout.leftEqualToView(_contentView).topSpaceToView(lastObj, 10.f).widthRatioToView(_contentView, 1.0);
            
            lastObj = section11;
        }
        
    }
    
    HomeVerListSection *section2 = [[HomeVerListSection alloc] init];
    
    [_contentView addSubview:section2];
    
    section2.goodsItemList = self.verGoodsItemList;

    
    section2.sd_layout.leftEqualToView(self.view).topSpaceToView(lastObj, 10.f).widthRatioToView(_contentView, 1.0);
    [_contentView setupAutoContentSizeWithBottomView:section2 bottomMargin:20.f];
}




@end
