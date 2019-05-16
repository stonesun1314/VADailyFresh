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


@interface HomeViewController ()<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>

@property (nonatomic, strong) HomeNavigationBar *navigationBar;
@property (nonatomic, strong) HomeSubViewController *viewController;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    [self.navigationController setNavigationBarHidden:YES];
    VIEWSAFEAREAINSETS(self.view);
//    self.view.safeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.additionalSafeAreaInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self setupUI];
    
    
}


- (void)setupUI{
    
    _headerView = [[UIView alloc] init];
//    _headerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_headerView];
    
    _headerView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topSpaceToView(self.view, Height_StatusBar).heightIs(124.f);
    
    _navigationBar = [[HomeNavigationBar alloc] init];
    _navigationBar.backgroundColor = [UIColor whiteColor];
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
        [childVCArr addObject:_viewController];
    }
    
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_headerView.frame) - Height_TabBar;
    
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
