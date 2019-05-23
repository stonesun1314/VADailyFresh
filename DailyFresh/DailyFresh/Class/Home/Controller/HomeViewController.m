//
//  HomeViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeSubViewController.h"
#import "DLSlideView.h"
#import "HomeNavigationBar.h"
#import "TestViewController.h"
#import "GoodsItemModel.h"
#import "HomeCateSectionModel.h"
#import "HomeTopAdSectionModel.h"
#import "HomeHeaderModel.h"
#import "HomeLimTimeSectionModel.h"
#import "HomeFeatureSectionModel.h"


@interface HomeViewController ()<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>

@property (nonatomic, strong) HomeNavigationBar *navigationBar;
@property (nonatomic, strong) HomeSubViewController *viewController;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;


@property (nonatomic, strong) NSDictionary *topDataSource;
@property (nonatomic, strong) HomeHeaderModel *headerBannerListModel;
@property (nonatomic, strong) HomeCateSectionModel *cateSectionModel;
@property (nonatomic, strong) HomeTopAdSectionModel *topSectionModel;
@property (nonatomic, strong) NSMutableArray *verGoodsItemList;
@property (nonatomic, strong) HomeLimTimeSectionModel *limTimeModel;
@property (nonatomic, strong) HomeFeatureSectionModel *featureModel;

@property (nonatomic, strong) NSMutableArray *topSectionArr;



@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    [self.navigationController setNavigationBarHidden:YES];
//    self.view.safeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self initDataSource];
    
    [self setupUI];
    
}

- (void)initDataSource {
    
    _topDataSource = [[VAMockDataSource shareInstance] readJsonFromFileName:@"index_top.json"];
//    VALog(@"top===/n%@",_topDataSource);
    
    
    NSDictionary *dataDict = [_topDataSource objectForKey:@"data"];
    NSDictionary *dict = [dataDict objectForKey:@"header"];
    
    _headerBannerListModel = [HomeHeaderModel yy_modelWithJSON:dict];
    
    
    NSArray *goodsItem = [dataDict objectForKey:@"goodsItem"];
    
    _topSectionArr = [NSMutableArray new];
    
    for (NSDictionary *dict in goodsItem) {
        NSNumber *itemType = [dict objectForKey:@"itemType"];
        if ([itemType integerValue] == 0) {    //类别
            
            _cateSectionModel = [HomeCateSectionModel yy_modelWithJSON:dict];
            
        }else if ([itemType integerValue] == 1){
            
            _limTimeModel = [HomeLimTimeSectionModel yy_modelWithJSON:dict];
            
            
        }else if ([itemType integerValue] == 2){       //特色专区
            
            _featureModel = [HomeFeatureSectionModel yy_modelWithJSON:dict];
            
        }else if ([itemType integerValue] == 3){       //top+横向列表
            HomeTopAdSectionModel *topAdModel = [HomeTopAdSectionModel yy_modelWithJSON:dict];
            [_topSectionArr addObject:topAdModel];
        }
    }
    
    
    NSDictionary *dictionary = [[VAMockDataSource shareInstance] readJsonFromFileName:@"index_recommend.json"];
//    VALog(@"%@",dictionary);
    
    NSArray *goodsItemList = [[dictionary objectForKey:@"data"] objectForKey:@"goods"];
    
    _verGoodsItemList = [NSMutableArray new];
    
    for (NSDictionary *dict in goodsItemList) {
        GoodsItemModel *model = [GoodsItemModel yy_modelWithJSON:dict];
        [_verGoodsItemList addObject:model];
    }
    
}


- (void)setupUI{
    
    _headerView = [[UIView alloc] init];
    [self.view addSubview:_headerView];
    
    _headerView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.view, Height_StatusBar).heightIs(124.f);
    
    _navigationBar = [[HomeNavigationBar alloc] init];
//    _navigationBar.backgroundColor = [UIColor whiteColor];
    [_headerView addSubview:_navigationBar];
    
    _navigationBar.sd_layout.leftEqualToView(_headerView).rightEqualToView(_headerView).topSpaceToView(_headerView, 0).heightIs(80.f);
    
    [_headerView updateLayout];
    

    NSArray *titleArr = @[@"热卖",@"会员特价",@"0元菜场",@"冰凉小卖铺",@"每日优鲜，2小时送达",@"荔枝来了"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.showIndicator = NO;
    configure.titleTextZoom = YES;
    configure.titleTextZoomRatio = 0.5;
    configure.titleAdditionalWidth = 30.f;
//    configure.titleGradientEffect = YES;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    //    [self.view addSubview:_pageTitleView];  //
    [_headerView addSubview:self.pageTitleView];
    
    NSMutableArray *childVCArr = [NSMutableArray new];
    
    for (NSString *title in titleArr) {
//        TestViewController *vc = [[TestViewController alloc] init];
//        [childVCArr addObject:vc];
        _viewController = [[HomeSubViewController alloc] init];
        _viewController.headerBannerModel = self.headerBannerListModel;
        _viewController.limTimeModel = _limTimeModel;
        _viewController.topAdModelArr = _topSectionArr;
        _viewController.cateSectionModel = _cateSectionModel;
        _viewController.verGoodsItemList = _verGoodsItemList;
        _viewController.featureModel = _featureModel;
        [childVCArr addObject:_viewController];
    }
    
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_headerView.frame);
    
    VALog(@"%@",_headerView);
    VALog(@"Max Y: %lf",CGRectGetMaxY(_headerView.frame));
    
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headerView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:childVCArr];
    _pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
    
//    _viewController = [[HomeSubViewController alloc] init];
//    [self addChildViewController:_viewController];
//    [_pageContentScrollView addSubview:_viewController.view];
//
//    _viewController.view.sd_layout.leftEqualToView(self.pageContentScrollView).widthRatioToView(self.pageContentScrollView, 1.0).bottomSpaceToView(self.pageContentScrollView, 0).topSpaceToView(self.pageContentScrollView, 0.f);
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
}

#pragma mark

- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}


@end
