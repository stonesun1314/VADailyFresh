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
    _headerView = [[UIView alloc] init];
//    _headerView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_headerView];
    
    _secondCateView = [[SecondCateView alloc] init];
    
    [_headerView addSubview:_secondCateView];
    
    _secondCateView.dataList = [[VAMockDataSource shareInstance] classifySecondCateList];
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(44.f);
    }];
    
    [_secondCateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.headerView);
    }];
    
//    _secondCateView.backgroundColor = [UIColor redColor];
    
    

    _aTableView = [[UITableView alloc] init];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    _aTableView.showsVerticalScrollIndicator = NO;
    _aTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _aTableView.backgroundColor = kMainBackgroundColor;

    [self.view addSubview:_aTableView];

    WeakSelf
    
    [_aTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(weakSelf.headerView.mas_bottom);
    }];
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
    headerView.textLabel.text = cateModel.cateName;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.f;
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
    
    
    return cell;
}

@end
