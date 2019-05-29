//
//  VAsearchViewController.m
//  DailyFresh
//
//  Created by Mac on 2019/5/29.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VAsearchViewController.h"
#import "VASearchGoodsItemListView.h"
#import "VASearchOptionsView.h"

@interface VAsearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *atableView;

@property (nonatomic, strong) VASearchGoodsItemListView *listView;
@property (nonatomic, strong) NSMutableArray *searchDataList;

@property (nonatomic, strong) VASearchOptionsView *optionsView;

@end

@implementation VAsearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initDatasource];
    [self setupUI];
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)initDatasource{
    NSDictionary *dictionary = [[VAMockDataSource shareInstance] readJsonFromFileName:@"index_recommend.json"];
    
    NSArray *goodsItemList = [[dictionary objectForKey:@"data"] objectForKey:@"goods"];
    
    _searchDataList = [NSMutableArray new];
    
    for (NSDictionary *dict in goodsItemList) {
        GoodsItemModel *model = [GoodsItemModel yy_modelWithJSON:dict];
        [_searchDataList addObject:model];
    }
}

- (void)setupUI{
    
    WeakSelf
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.navigationController.navigationBar.size.width, Height_NavBar)];
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.delegate = self;
//    _searchBar.showsCancelButton = YES;
    _searchBar.placeholder = @"请输入商品名称";
//    _searchBar.showsBookmarkButton = YES;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [titleView addSubview:_searchBar];
    
    //通过KVC拿到textField
    UITextField  *seachTextFild = [self.searchBar valueForKey:@"searchField"];
    //修改字体颜色
//    seachTextFild.textColor = [UIColor redColor];
    //修改字体大小
    seachTextFild.font = [UIFont systemFontOfSize:14];
    
    _searchBar.sd_layout.leftSpaceToView(titleView, 0.f).rightSpaceToView(titleView, 5.f).centerYEqualToView(titleView).heightIs(30.f);
    self.searchBar.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = titleView;
    
    _optionsView = [[VASearchOptionsView alloc] initWithFrame:self.view.bounds];
    _optionsView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:_optionsView];
    
    _optionsView.selectItemBlock = ^(NSString *text) {
//        [weakSelf.searchBar becomeFirstResponder];
        _optionsView.hidden = YES;
        weakSelf.searchBar.text = text;
        weakSelf.scrollView.hidden = NO;
        [weakSelf.atableView reloadData];
    };
    
    [_optionsView reloadData];
    
    _atableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.size.width, self.view.size.height) style:UITableViewStylePlain];
    _atableView.delegate = self;
    _atableView.dataSource = self;
    [self.view addSubview:_atableView];
    
    _atableView.hidden = YES;
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleWidth);
    [self.view addSubview:_scrollView];
    
    _scrollView.hidden = YES;
    
    _scrollView.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view)
    .topEqualToView(self.view).bottomEqualToView(self.view);
    
    
    _listView = [[VASearchGoodsItemListView alloc] init];
    _listView.goodsItemList = _searchDataList;
    [_scrollView addSubview:_listView];
    
    [_scrollView setupAutoContentSizeWithBottomView:_listView bottomMargin:10.f];
    
    _listView.sd_layout.leftEqualToView(_scrollView).topSpaceToView(_scrollView, 0.f).widthRatioToView(_scrollView, 1.0);

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _searchDataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    GoodsItemModel *model = [_searchDataList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%@",_searchBar.text,model.name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;                     // called when text starts editing
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;                        // return NO to not resign first responder
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;                       // called when text ends editing
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
//- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0); // called before text changes
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;                     // called when keyboard search button pressed
//- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED; // called when bookmark button pressed
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED;

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{

    


    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) { if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
        UIButton * cancel =(UIButton *)view;
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:kUITitleColor forState:UIControlStateNormal];
        cancel.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0) {
        _optionsView.hidden = NO;
        _atableView.hidden = YES;
        _scrollView.hidden = YES;
    }else{
        _atableView.hidden = NO;
        _scrollView.hidden = YES;
    }
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    VALog(@"%@",text);
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    _optionsView.hidden = YES;
    _atableView.hidden = YES;
    _scrollView.hidden = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [searchBar resignFirstResponder];
    [_atableView reloadData];
    _atableView.hidden = YES;
    _scrollView.hidden = YES;
}

@end
