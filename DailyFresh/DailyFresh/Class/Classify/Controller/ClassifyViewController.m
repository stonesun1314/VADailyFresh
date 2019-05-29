//
//  ClassifyViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ClassifyViewController.h"

#import "ClassifyNavView.h"
#import "ClassifyLeftViewController.h"
#import "ClassifyRightViewController.h"
#import "SecondCateModel.h"
#import "VALocationViewController.h"



@interface ClassifyViewController ()

@property (nonatomic, strong) ClassifyNavView *navView;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) ClassifyLeftViewController *leftVC;
@property (nonatomic, strong) ClassifyRightViewController *rightVC;

@property (nonatomic, strong) NSArray *leftCateList;
@property (nonatomic, strong) NSMutableArray *rightCateList;



@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:YES];
    
    [self initDataSource];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)initDataSource {
    _leftCateList = [[VAMockDataSource shareInstance] classifyFirstCateList];
    
    [self readRightData];
}

- (void)readRightData{
    NSDictionary *dictionary = [[VAMockDataSource shareInstance] readJsonFromFileName:@"cate_goods.json"];
    
    NSArray *cateList = [[dictionary objectForKey:@"data"] objectForKey:@"cateList"];
    
    _rightCateList = [NSMutableArray new];
    
    for (NSDictionary *dict in cateList) {
        SecondCateModel *model = [SecondCateModel yy_modelWithJSON:dict];
        [_rightCateList addObject:model];
    }
}

- (void)setupUI{
    WeakSelf
    _navView = [[ClassifyNavView alloc] init];
    _navView.handleLocationBlock = ^{
        [weakSelf goLocationVC];
    };
    [self.view addSubview:_navView];
    
    [_navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_topLayoutGuide);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44.f);
    }];
    
    _contentView = [[UIView alloc] init];
//    _contentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.bottom.mas_equalTo(self.mas_bottomLayoutGuide);
    }];
    
    _leftVC = [[ClassifyLeftViewController alloc] init];
    _leftVC.dataList = _leftCateList;
    _leftVC.selectedCateBlock = ^(NSInteger index) {
        [weakSelf.rightVC clearAllData];
        [weakSelf readRightData];
        weakSelf.rightVC.dataList = weakSelf.rightCateList;
        [weakSelf.rightVC reloadData];
    };
    [self addChildViewController:_leftVC];
    
    [self.view addSubview:_leftVC.view];
    
    _rightVC = [[ClassifyRightViewController alloc] init];
    _rightVC.dataList = _rightCateList;
    [self addChildViewController:_rightVC];
    
    [self.view addSubview:_rightVC.view];
    
    [_leftVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.width.mas_equalTo(80.f);
    }];
    
    [_rightVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftVC.view.mas_right);
        make.top.mas_equalTo(self.navView.mas_bottom);
        make.bottom.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView);
    }];
    

}

- (void)goLocationVC{
    VALocationViewController *vc = [[VALocationViewController alloc] init];
    vc.selectLocationBlock = ^(NSString *text) {
        _navView.locationStr = text;
    };
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
