//
//  MineViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"
#import "MinePropertySectionView.h"
#import "MineOrderServiceSectionView.h"
#import "MineScrollSectionView.h"
#import "MineServiceSectionView.h"

@interface MineViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

//=== header ===

@property (nonatomic, strong) MineHeaderView *headerView;

@property (nonatomic, strong) MinePropertySectionView *propertySectionView;
@property (nonatomic, strong) MineOrderServiceSectionView *orderServiceSectionView;
@property (nonatomic, strong) MineScrollSectionView *scrollSectionView;
@property (nonatomic, strong) MineServiceSectionView *serviceSectionView;



@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    self.automaticallyAdjustsScrollViewInsets = false;
    
    
    //df_me_go_appstore_evaluate@2x     头像  //df_logo_meiriyouxian@2x
    
    //糊状阴影 mePageMaskIcon@2x.png
    
    //vipMemberOpenLabel@2x.png 文字
    
    //df_share_detail_backImage@2x
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    self.navigationController.navigationBar.translucent = YES;

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)setupUI{
    
    UIView *view =[[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -20, self.view.size.width, self.view.size.height+20)];
    if(@available(iOS 11.0, *)){
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentScrollableAxes;
    }
    _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin);
    [self.view addSubview:_scrollView];
    

    VALog(@"%@",_scrollView);
    
    _headerView = [[MineHeaderView alloc] init];
    [_scrollView addSubview:_headerView];
    
    _propertySectionView = [[MinePropertySectionView alloc] init];
    [_scrollView addSubview:_propertySectionView];
    
    _orderServiceSectionView = [[MineOrderServiceSectionView alloc] init];
    [_scrollView addSubview:_orderServiceSectionView];
    
    _scrollSectionView = [[MineScrollSectionView alloc] init];
//    _scrollSectionView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_scrollSectionView];
    
    _serviceSectionView = [[MineServiceSectionView alloc] init];
//    _serviceSectionView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_serviceSectionView];
    
    _headerView.sd_layout.leftEqualToView(_scrollView).rightEqualToView(_scrollView)
    .topEqualToView(_scrollView).heightIs(200.f);
    
    _propertySectionView.sd_layout.leftEqualToView(_scrollView).rightEqualToView(_scrollView)
    .topSpaceToView(_headerView, -10.f);
    
    _orderServiceSectionView.sd_layout.leftEqualToView(_scrollView).
    rightEqualToView(_scrollView).topSpaceToView(_propertySectionView, 10.f);


    _scrollSectionView.sd_layout.leftEqualToView(_scrollView).rightEqualToView(_scrollView)
    .topSpaceToView(_orderServiceSectionView, 10.f);
    
    _serviceSectionView.sd_layout.leftEqualToView(_scrollView).rightEqualToView(_scrollView)
    .topSpaceToView(_scrollSectionView, 10.f);
    
    [_scrollView setupAutoContentSizeWithBottomView:_serviceSectionView bottomMargin:30.f];
}

@end
