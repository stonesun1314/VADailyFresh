//
//  ShoppingCartViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "CartTableViewCell.h"

typedef NS_ENUM(NSInteger, ShoppingCartState) {
    ShoppingCartStateEmpty      = 1,    //空
    ShoppingCartStateStore              //存放状态
};

@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *atableView;

@property (nonatomic, strong) NSMutableArray *cartList;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"购物车";
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)setupUI{
    
    _atableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _atableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    _atableView.showsVerticalScrollIndicator = NO;
    _atableView.delegate = self;
    _atableView.dataSource = self;
    [self.view addSubview:_atableView];

    WeakSelf
    VAMJRefreshGifHeader *header = [VAMJRefreshGifHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.atableView.mj_header endRefreshing];
        });
    }];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    [header beginRefreshing];
    
    _atableView.mj_header = header;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.f;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    CartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[CartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.model = nil;
    return cell;
}


@end
