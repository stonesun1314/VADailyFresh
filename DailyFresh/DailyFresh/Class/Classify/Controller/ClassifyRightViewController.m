//
//  ClassifyRightViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ClassifyRightViewController.h"
#import "RightTableViewCell.h"
#import "SecondCateView.h"
#import "SecondCateModel.h"
#import "ClassifyRightHeaderView.h"

@interface ClassifyRightViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *tagsContentView;

@property (nonatomic, strong) SecondCateView *secondCateView;




@end

@implementation ClassifyRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
//    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)setupUI{
    WeakSelf
    _headerView = [[UIView alloc] init];
//    _headerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_headerView];
    
    _secondCateView = [[SecondCateView alloc] init];
    _secondCateView.dataList = self.dataList;
    _secondCateView.selectedCateBlock = ^(NSInteger index, SecondCateModel * _Nonnull model) {
        if (weakSelf.dataList.count > index) {
            [weakSelf.aTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    };
    [_headerView addSubview:_secondCateView];
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(44.f);
    }];
    
    [_secondCateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.headerView);
    }];
    

    _aTableView = [[UITableView alloc] init];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    _aTableView.showsVerticalScrollIndicator = NO;
    _aTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _aTableView.backgroundColor = kMainBackgroundColor;
    _aTableView.tableFooterView = [UIView new];

    [self.view addSubview:_aTableView];

    [_aTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(weakSelf.headerView.mas_bottom);
    }];
    
    VAMJRefreshGifHeader *header = [VAMJRefreshGifHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.aTableView.mj_header endRefreshing];
        });
    }];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    [header beginRefreshing];
    
    _aTableView.mj_header = header;
}

#pragma mark -- tableView

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"新人大礼包";//[NSString stringWithFormat:@"新人大礼包-%ld",section];// @"新人大礼包";
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *header = @"header";
    
    ClassifyRightHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:header];
    if (!headerView) {
        headerView = [[ClassifyRightHeaderView alloc] initWithReuseIdentifier:header];
    }
    SecondCateModel *cateModel = [_dataList objectAtIndex:section];
    headerView.titleLabel.text = cateModel.cateName;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SecondCateModel *model = [_dataList objectAtIndex:section];
    return model.goods.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 122.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[RightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    
    
    SecondCateModel *cateModel = [_dataList objectAtIndex:indexPath.section];
    GoodsItemModel *goodsModel = [cateModel.goods objectAtIndex:indexPath.row];
    
    cell.model = goodsModel;
    
    cell.addCartBlock = ^(GoodsItemModel *model, NSInteger num) {
        [[VAMockDataSource shareInstance] addShoppingCart:model];
    };
    
    
    return cell;
}

- (void)clearAllData {
    [self.dataList removeAllObjects];
    _secondCateView.dataList = nil;
    [self.aTableView reloadData];
}

- (void)reloadData{
    WeakSelf
    
    [self.aTableView.mj_header beginRefreshing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       weakSelf.secondCateView.dataList = self.dataList;
        [weakSelf.aTableView reloadData];
        [weakSelf.aTableView.mj_header endRefreshing];
    });
}

@end
