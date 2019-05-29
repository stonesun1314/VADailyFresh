//
//  HomeNavigationBar.m
//  DailyFresh
//
//  Created by Mac on 2019/5/15.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeNavigationBar.h"

@interface HomeNavigationBar ()<UISearchBarDelegate>

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIButton *locationBtn;
@property (nonatomic, strong) UIImageView *locationArrow;

@property (nonatomic, strong) UIButton *scanBtn;

@property (nonatomic, strong) UISearchBar *searchBar;


@end

@implementation HomeNavigationBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDataSource];
        [self setupUI];
    }
    return self;
}

- (void)initDataSource {
    _locationStr = @"万科大厦";
}

- (void)setupUI{
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"df_jisuda"];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_iconImageView];
    
    
    
    _locationBtn = [[UIButton alloc] init];
//    [_locationBtn setImage:[UIImage imageNamed:@"df_orderDownImage"] forState:UIControlStateNormal];
    [_locationBtn setTitle:_locationStr forState:UIControlStateNormal];
    [_locationBtn setTitleColor:kUITitleColor forState:UIControlStateNormal];
    _locationBtn.titleLabel.font = [UIFont systemFontOfSize:kUISubtitleFontSize];
    [_locationBtn addTarget:self action:@selector(handleLocation:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_locationBtn];
    
    _locationArrow = [[UIImageView alloc] init];
    _locationArrow.image = [UIImage imageNamed:@"df_orderDownImage"];
    [self addSubview:_locationArrow];
    
    _scanBtn = [[UIButton alloc] init];
    [_scanBtn setImage:[UIImage imageNamed:@"df_qrcode_black"] forState:UIControlStateNormal];
    [_scanBtn addTarget:self action:@selector(handleScan:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_scanBtn];
    
    _iconImageView.sd_layout.leftSpaceToView(self, VAMargin).topSpaceToView(self, 10.f).widthIs(55).heightIs(30.f);
    _locationBtn.sd_layout.leftSpaceToView(_iconImageView, 0.f).centerYEqualToView(_iconImageView).heightIs(40.f);
    
    [_locationBtn setupAutoSizeWithHorizontalPadding:10 buttonHeight:40.f];
    
    [_locationBtn SG_imagePositionStyle:SGImagePositionStyleDefault spacing:10.f];
    
    _locationArrow.sd_layout.leftSpaceToView(_locationBtn, -5.f).centerYEqualToView(_locationBtn).widthIs(10.f).heightIs(6.f);
    
    _scanBtn.sd_layout.rightSpaceToView(self, VAMargin).centerYEqualToView(_iconImageView).widthIs(48.f).heightIs(48.f);
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.delegate = self;
//    _searchBar.barStyle = UIBarStyleBlack;
    
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
//    [self.searchBar setImage:[UIImage imageNamed:@"df_searchIconImage"]
//                  forSearchBarIcon:UISearchBarIconSearch
//                             state:UIControlStateNormal];
    [self addSubview:_searchBar];
    
    _searchBar.sd_layout.leftSpaceToView(self, 0).rightSpaceToView(self, 0).topSpaceToView(_iconImageView, 5.f).heightIs(30.f);
//    [[self.searchBar.subviews objectAtIndex:0] removeFromSuperview];
    self.searchBar.backgroundColor = [UIColor clearColor];
}

- (void)handleScan:(UIButton *)sender {
    if (self.handleScanBlock) {
        self.handleScanBlock();
    }
}

- (void)handleLocation:(UIButton *)sender {
    if (self.handleLocationBlock) {
        self.handleLocationBlock();
    }
}

- (void)setLocationStr:(NSString *)locationStr{
    _locationStr = locationStr;
    [_locationBtn setTitle:_locationStr forState:UIControlStateNormal];
}

//- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder
//- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;                     // called when text starts editing
//- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;                        // return NO to not resign first responder
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;                       // called when text ends editing
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    if (self.beiginEditSearchBlock) {
        self.beiginEditSearchBlock();
    }
    
    return NO;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{

}

@end
