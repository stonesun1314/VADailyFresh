//
//  HomeNavigationBar.m
//  DailyFresh
//
//  Created by Mac on 2019/5/15.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "HomeNavigationBar.h"

@interface HomeNavigationBar ()

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
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"df_jisuda"];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_iconImageView];
    
    _locationBtn = [[UIButton alloc] init];
//    [_locationBtn setImage:[UIImage imageNamed:@"df_orderDownImage"] forState:UIControlStateNormal];
    [_locationBtn setTitle:@"万科大厦" forState:UIControlStateNormal];
    [_locationBtn setTitleColor:kUITitleColor forState:UIControlStateNormal];
    _locationBtn.titleLabel.font = [UIFont systemFontOfSize:kUISubtitleFontSize];
    [self addSubview:_locationBtn];
    
    _locationArrow = [[UIImageView alloc] init];
    _locationArrow.image = [UIImage imageNamed:@"df_orderDownImage"];
    [self addSubview:_locationArrow];
    
    
    
    
    
    _scanBtn = [[UIButton alloc] init];
    [_scanBtn setImage:[UIImage imageNamed:@"df_qrcode_black"] forState:UIControlStateNormal];
    [self addSubview:_scanBtn];
    
    
    _iconImageView.sd_layout.leftSpaceToView(self, VAMargin).topSpaceToView(self, 10.f).widthIs(55).heightIs(30.f);
    _locationBtn.sd_layout.leftSpaceToView(_iconImageView, 0.f).centerYEqualToView(_iconImageView).heightIs(40.f);
    
    [_locationBtn setupAutoSizeWithHorizontalPadding:10 buttonHeight:40.f];
    
    [_locationBtn SG_imagePositionStyle:SGImagePositionStyleDefault spacing:10.f];
    
    _locationArrow.sd_layout.leftSpaceToView(_locationBtn, -5.f).centerYEqualToView(_locationBtn).widthIs(10.f).heightIs(6.f);
    
    _scanBtn.sd_layout.rightSpaceToView(self, VAMargin).centerYEqualToView(_iconImageView).widthIs(48.f).heightIs(48.f);
    
    _searchBar = [[UISearchBar alloc] init];
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



@end
