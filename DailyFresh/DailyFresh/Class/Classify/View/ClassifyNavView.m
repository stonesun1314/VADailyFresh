//
//  ClassifyNavView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/16.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ClassifyNavView.h"

@interface ClassifyNavView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIButton *locationBtn;
@property (nonatomic, strong) UIImageView *locationArrow;

@property (nonatomic, strong) UIButton *scanBtn;


@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation ClassifyNavView

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
    
    

    

    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self addSubview:_searchBar];
//
//    self.searchBar.backgroundColor = [UIColor clearColor];
    
//    _iconImageView.sd_layout.leftSpaceToView(self, VAMargin).topSpaceToView(self, 10.f).widthIs(55).heightIs(30.f);
//    _locationBtn.sd_layout.leftSpaceToView(_iconImageView, 0.f).centerYEqualToView(_iconImageView).heightIs(40.f);
//    
//    [_locationBtn setupAutoSizeWithHorizontalPadding:10 buttonHeight:40.f];
//    
//    [_locationBtn SG_imagePositionStyle:SGImagePositionStyleDefault spacing:10.f];
//    
//    _locationArrow.sd_layout.leftSpaceToView(_locationBtn, -5.f).centerYEqualToView(_locationBtn).widthIs(10.f).heightIs(6.f);
//    
//    _scanBtn.sd_layout.rightSpaceToView(self, VAMargin).centerYEqualToView(_iconImageView).widthIs(48.f).heightIs(48.f);
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(VAMargin);
        make.width.mas_equalTo(55.f);
        make.height.mas_equalTo(30.f);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [_locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(40.f);
        make.width.lessThanOrEqualTo(@60.f);
    }];
    
    [_locationArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.locationBtn.mas_right).offset(5.f);
        make.centerY.mas_equalTo(self);
        make.width.mas_equalTo(10.f);
        make.height.mas_equalTo(6.f);
    }];
    
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-VAMargin);
        make.width.height.mas_equalTo(44.f);
        make.centerY.mas_equalTo(self);
    }];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.locationArrow.mas_right).offset(0.f);
        make.right.mas_equalTo(self.scanBtn.mas_left).offset(-5.f);
        make.height.mas_equalTo(@30.f);
        make.centerY.mas_equalTo(self);
    }];
    
    
    
}


@end
