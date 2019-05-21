//
//  DiscoveryViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "DiscoverySubViewController.h"

@interface DiscoveryViewController ()<SGPageTitleViewDelegate, SGPageContentScrollViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentScrollView *pageContentScrollView;



@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationItem.title = @"发现";
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)setupUI{
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//    leftBtn.layer.cornerRadius = 22.f;
//    leftBtn.clipsToBounds = YES;
//    [leftBtn setImage:[UIImage imageNamed:@"df_discover_avatar"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(handleAvatar:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 24)];
    imageView.layer.cornerRadius = 12.f;
    imageView.clipsToBounds = YES;
    imageView.center = leftBtn.center;
    imageView.image = [UIImage imageNamed:@"df_discover_avatar"];
    [leftBtn addSubview:imageView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
//    CGFloat statusHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
//    CGFloat pageTitleViewY = 0;
//    if (statusHeight == 20.0) {
//        pageTitleViewY = 64;
//    } else {
//        pageTitleViewY = 88;
//    }
    
    CGFloat  pageTitleViewY = 0;
    NSArray *titleArr = @[@"精选", @"快手食谱", @"甜点饮品", @"生活百科"];
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorStyle = SGIndicatorStyleFixed;
    configure.bottomSeparatorColor = kSeparatorLineColor;
    configure.indicatorBorderColor = kMainColor;
    //    configure.indicatorScrollStyle = SGIndicatorScrollStyleHalf;
    //    configure.indicatorFixedWidth = 50;
    
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, pageTitleViewY, self.view.frame.size.width, 44) delegate:self titleNames:titleArr configure:configure];
    
    [self.view addSubview:_pageTitleView];
    _pageTitleView.selectedIndex = 0;
    
    
    NSMutableArray *childArr = [NSMutableArray new];
    
    for (NSString *title in titleArr) {
        DiscoverySubViewController *vc = [[DiscoverySubViewController alloc] init];
        [childArr addObject:vc];
    }
    
    /// pageContentCollectionView
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame) - Height_TabBar - Height_NavBar;
    self.pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:childArr];
    self.pageContentScrollView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    _pageContentScrollView.delegatePageContentScrollView = self;
    [self.view addSubview:_pageContentScrollView];
}


- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
}

- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}



- (void)handleAvatar:(UIButton *)sender {
    VALog();
}

@end
