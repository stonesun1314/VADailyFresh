//
//  DiscoveryViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "DiscoverySubViewController.h"

@interface DiscoveryViewController ()<SGPageTitleViewDelegate, SGPageContentCollectionViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentCollectionView *pageContentCollectionView;



@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发现";
    
    [self setupUI];
}

- (void)setupUI{
    
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
    CGFloat ContentCollectionViewHeight = self.view.frame.size.height - CGRectGetMaxY(_pageTitleView.frame);
    self.pageContentCollectionView = [[SGPageContentCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_pageTitleView.frame), self.view.frame.size.width, ContentCollectionViewHeight) parentVC:self childVCs:childArr];
    _pageContentCollectionView.delegatePageContentCollectionView = self;
    [self.view addSubview:_pageContentCollectionView];
}


- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentCollectionView setPageContentCollectionViewCurrentIndex:selectedIndex];
}


@end
