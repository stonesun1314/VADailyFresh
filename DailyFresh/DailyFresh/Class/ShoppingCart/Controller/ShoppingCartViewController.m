//
//  ShoppingCartViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "CartTableViewCell.h"
#import "CartRecomListView.h"
#import "CartEmptyView.h"
#import "CartSettlingView.h"

typedef NS_ENUM(NSInteger, ShoppingCartState) {
    ShoppingCartStateEmpty      = 1,    //空
    ShoppingCartStateStore              //存放状态
};

@interface ShoppingCartViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *atableView;

@property (nonatomic, strong) NSMutableArray *cartList;

@property (nonatomic, strong) CartEmptyView *emptyView;
@property (nonatomic, strong) CartRecomListView *tableFooterView;
@property (nonatomic, strong) NSMutableArray <GoodsItemModel *>* recomGoodsList;

@property (nonatomic, strong) CartSettlingView *settlingView; //结算

@end

@implementation ShoppingCartViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"购物车";
    
    [self initDataSource];
    [self setupUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cartChangeNotice:) name:VAShoppingCardChangeNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)initDataSource{
    
    _cartList = [VAMockDataSource shareInstance].cartList;
    
    NSDictionary *dictionary = [[VAMockDataSource shareInstance] readJsonFromFileName:@"index_recommend.json"];
    //    VALog(@"%@",dictionary);
    
    NSArray *goodsItemList = [[dictionary objectForKey:@"data"] objectForKey:@"goods"];
    
    _recomGoodsList = [NSMutableArray new];
    
    for (NSDictionary *dict in goodsItemList) {
        GoodsItemModel *model = [GoodsItemModel yy_modelWithJSON:dict];
        [_recomGoodsList addObject:model];
    }
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
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf reloadData];
        });
    }];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    [header beginRefreshing];
    _atableView.mj_header = header;
    
    _tableFooterView = [[CartRecomListView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    _atableView.tableFooterView = _tableFooterView;
    _tableFooterView.goodsItemList = _recomGoodsList;
    [_tableFooterView updateLayout];
    _atableView.tableFooterView = _tableFooterView;
    
    _emptyView = [[CartEmptyView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 250.f)];
    
    _settlingView = [[CartSettlingView alloc] init];
    _settlingView.selectAllBlock = ^(BOOL select) {
        for (CartGoodsItemModel *model in weakSelf.cartList) {
            model.selected = select;
            
        }
        
        [weakSelf calSelectedItemPrice];
        
        [weakSelf reloadData];
    };
    [self.view addSubview:_settlingView];
    _settlingView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).bottomEqualToView(self.view).heightIs(50.f);
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110.f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cartList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    CartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[CartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CartGoodsItemModel *model = [_cartList objectAtIndex:indexPath.row];
    cell.model = model;
    cell.addCartBlock = ^(GoodsItemModel *model, NSInteger num) {
        [self calSelectedItemPrice];
        [[VAMockDataSource shareInstance] writeCartItemsToFile];
    };
    cell.subCartBlock = ^(GoodsItemModel *model, NSInteger num) {
        if ([model.goodsNum integerValue] <= 0) { //商品数量为0，则删除
            [self deleteCartItem:indexPath];
        }
        [self calSelectedItemPrice];
        [[VAMockDataSource shareInstance] writeCartItemsToFile];
    };
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}

//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    VALog(@"");
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //如果编辑样式为删除样式
        [self deleteCartItem:indexPath];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[VAMockDataSource shareInstance] writeCartItemsToFile];
        });
        
        [self calSelectedItemPrice];
    }
}


#pragma mark -- notice
- (void)cartChangeNotice:(NSNotification *)notice{
    
    [self reloadData];

}

- (void)reloadData{
    _cartList = [VAMockDataSource shareInstance].cartList;
    
    [_atableView reloadData];
    
    if (_cartList.count == 0) {
        _atableView.tableHeaderView = _emptyView;
    }else{
        _atableView.tableHeaderView = nil;
    }
    
    [_atableView.mj_header endRefreshing];
    
}

- (void)deleteCartItem:(NSIndexPath *)indexPath{
    if (self.cartList.count > indexPath.row) {
        [self.cartList removeObjectAtIndex:indexPath.row];//移除数据源的数据
        [_atableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

}

- (void)calSelectedItemPrice {
    NSInteger selectedPrice = 0;
    for (CartGoodsItemModel *model in self.cartList) {
        if (model.selected) {
            selectedPrice += ([model.price integerValue] * [model.goodsNum integerValue]);
        }
        
    }
    
     self.settlingView.totalPrice = [NSString stringWithFormat:@"%ld",selectedPrice];
}



@end
