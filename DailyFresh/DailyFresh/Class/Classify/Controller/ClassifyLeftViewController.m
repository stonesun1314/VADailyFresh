//
//  ClassifyLeftViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ClassifyLeftViewController.h"
#import "LeftTableViewCell.h"

@interface ClassifyLeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ClassifyLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

- (void)setupUI{
    _aTableView = [[UITableView alloc] init];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    _aTableView.showsVerticalScrollIndicator = NO;
    _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _aTableView.backgroundColor = kDarkMainBackgroundColor;

    [self.view addSubview:_aTableView];
    
    [_aTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80.f);
        make.top.bottom.left.mas_equalTo(self.view);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[LeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.backgroundColor = kDarkMainBackgroundColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.titleLabel.text = [_dataList objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}



@end
