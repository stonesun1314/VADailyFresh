//
//  MineHeaderView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/24.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()

@property (nonatomic, strong) UIImageView *cardImageView;

@property (nonatomic, strong) UIImageView *vipRightImageView;
@property (nonatomic, strong) UIButton *openVipBtn;

@end

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat offsetY = Height_NavBar;//64;
        
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.image = [UIImage imageNamed:@"df_me_top_bg"];
        [self addSubview:_bgImageView];
        
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.image = [UIImage imageNamed:@"df_me_go_appstore_evaluate"];
        _avatarImageView.layer.cornerRadius = 30.f;
        _avatarImageView.clipsToBounds = YES;
        [self addSubview:_avatarImageView];
        
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn addTarget:self action:@selector(handleLogin:) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setTitle:@"登录/注册" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:kUITitleColor forState:UIControlStateNormal];
        
        [self addSubview:_loginBtn];
        
        _messageBtn = [[UIButton alloc] init];
        [_messageBtn setImage:[UIImage imageNamed:@"df_me_message_icon"] forState:UIControlStateNormal];
        [self addSubview:_messageBtn];
        
        _cardImageView = [[UIImageView alloc] init];
        _cardImageView.image = [UIImage imageNamed:@"df_me_vip_cardbg"];
        [self addSubview:_cardImageView];
        
        _vipRightImageView = [[UIImageView alloc] init];
        _vipRightImageView.image = [UIImage imageNamed:@"df_vipMemberOpenLabel"];
        [_cardImageView addSubview:_vipRightImageView];
        
        _openVipBtn = [[UIButton alloc] init];
        [_openVipBtn setTitle:@"开通会员" forState:UIControlStateNormal];
        [_openVipBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _openVipBtn.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [_openVipBtn setBackgroundImage:[UIImage imageNamed:@"df_goods_coupon_open_vip_bg"] forState:UIControlStateNormal];
        [_cardImageView addSubview:_openVipBtn];
        
        _vipRightImageView.sd_layout.leftSpaceToView(_cardImageView, 10.f).topSpaceToView(_cardImageView, 10.f).widthIs(115.f).heightIs(17.f);
        
        _openVipBtn.sd_layout.rightSpaceToView(_cardImageView, 8.f).widthIs(70).heightIs(24.f).topSpaceToView(_cardImageView, 7.f);
        
        _bgImageView.sd_layout.leftEqualToView(self).rightEqualToView(self).
        topEqualToView(self).bottomEqualToView(self);
        
        _avatarImageView.sd_layout.leftSpaceToView(self, VAMargin).widthIs(60.f).heightIs(60).topSpaceToView(self, offsetY);
        
        _loginBtn.sd_layout.leftSpaceToView(_avatarImageView, 10.f).centerYEqualToView(_avatarImageView).widthIs(80.f).heightIs(60.f);
        _messageBtn.sd_layout.rightSpaceToView(self, VAMargin).centerYEqualToView(_avatarImageView).widthIs(44).heightIs(44.f);
        
        _cardImageView.sd_layout.heightIs(120.f).leftSpaceToView(self, VAMargin).rightSpaceToView(self, VAMargin).bottomSpaceToView(self, -80);
        
        
    }
    return self;
}


- (void)handleLogin:(UIButton *)sender{
    if (self.loginBlock) {
        self.loginBlock();
    }
}

//- (void)me

@end
