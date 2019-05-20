//
//  DiscoverySubViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/20.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "DiscoverySubViewController.h"
#import "DiscoveryTableViewCell.h"
#import "DisArticalModel.h"

@interface DiscoverySubViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *atableView;

@property (nonatomic, strong) NSMutableArray *findDataList;

@end

@implementation DiscoverySubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.view.backgroundColor = KColorRandomColor;
    
    [self initDataSource];
    [self setupUI];
}

- (void)initDataSource{
    NSDictionary *dict = [[VAMockDataSource shareInstance] readJsonFromFileName:@"find_data.json"];
    
    _findDataList = [NSMutableArray new];
    
    NSArray *arr = [[dict objectForKey:@"data"] objectForKey:@"newsList"];
    
    for (NSDictionary *dict in arr) {
        DisArticalModel *model = [DisArticalModel yy_modelWithJSON:dict];
        [_findDataList addObject:model];
    }
}

- (void)setupUI{
    _atableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _atableView.showsVerticalScrollIndicator = NO;
    _atableView.delegate = self;
    _atableView.dataSource = self;
//    _atableView.estimatedRowHeight = 130.f;
    [self.view addSubview:_atableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _findDataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisArticalModel *model = [_findDataList objectAtIndex:indexPath.row];
    if ([model.isTopType boolValue]) {
        return 320.f;
    }

    return 130.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    DiscoveryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[DiscoveryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    DisArticalModel *model = [_findDataList objectAtIndex:indexPath.row];
    
    cell.model = model;
    
    return cell;
}

@end
