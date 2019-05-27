//
//  SettingViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/27.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *atableView;

@property (nonatomic, strong) UIView *tableHeaderView;

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UILabel *versionLabel;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"设置";
    
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)setupUI{
    _atableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _atableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    _atableView.delegate = self;
    _atableView.dataSource = self;
    _atableView.backgroundColor = kUIContentBackgroundColor;
    [self.view addSubview:_atableView];
    
    _atableView.tableFooterView = [UIView new];
    
    //df_me_go_appstore_evaluate@2x
    _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.size.width, 200.f)];
    _tableHeaderView.backgroundColor = kUIContentBackgroundColor;
    _logoImageView = [[UIImageView alloc] init];
    _logoImageView.image = [UIImage imageNamed:@"df_me_go_appstore_evaluate"];
    [_tableHeaderView addSubview:_logoImageView];
    
    _versionLabel = [UILabel new];
    _versionLabel.text = @"版本号 v1.0.0";
    _versionLabel.textColor = kUISubTitleColor;
    _versionLabel.font = [UIFont systemFontOfSize:9.f];
    [_tableHeaderView addSubview:_versionLabel];
    
    _logoImageView.sd_layout.centerXEqualToView(_tableHeaderView).topSpaceToView(_tableHeaderView, 50.f).widthIs(80.f).heightIs(80.f);
    
    _versionLabel.sd_layout.centerXEqualToView(_tableHeaderView).topSpaceToView(_logoImageView, 10.f).autoWidthRatio(0).autoHeightRatio(0);
    [_versionLabel setSingleLineAutoResizeWithMaxWidth:200.f];
    [_versionLabel setMaxNumberOfLinesToShow:1];
    
    _atableView.tableHeaderView = _tableHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.size.width, 10)];
    view.backgroundColor = kUIContentBackgroundColor;
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    [self cofigTableCell:cell indexPath:indexPath];
    return cell;
}

- (void)cofigTableCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"意见与反馈";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"欢迎评分";
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"用户协议";
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"隐私策略";
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"清除缓存";
        }
    }
}

@end
