//
//  ShoppingCartViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/8.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ShoppingCartViewController.h"

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
    self.navigationItem.title = @"购物车";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}


@end
