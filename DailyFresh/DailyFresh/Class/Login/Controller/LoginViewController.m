//
//  LoginViewController.m
//  VankePay
//
//  Created by Mac on 2018/12/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "LoginViewController.h"
#import "UnderlineTextField.h"
#import "PasswordTextField.h"


@interface LoginViewController ()<UITextFieldDelegate>{
    CGFloat _margin;
}


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UnderlineTextField *phoneNumberTextField;
@property (nonatomic, strong) UnderlineTextField *passwordTextField;
@property (nonatomic, strong) UIButton *showPwdBtn;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;

@end

@implementation LoginViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}


- (void)setupUI{
    _margin = 30.f;
    WeakSelf
    _titleLabel = [[UILabel alloc] init];
//    _titleLabel.text = @"欢迎使用万物钱包";
    _titleLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:_titleLabel];
    
    _phoneNumberTextField = [[UnderlineTextField alloc] init];
    _phoneNumberTextField.placeholder = @"请输入账号";
    _phoneNumberTextField.delegate = self;
    _phoneNumberTextField.font = [UIFont systemFontOfSize:15.f];
    _phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneNumberTextField.clearButtonMode = UITextFieldViewModeAlways;
    _phoneNumberTextField.textColor = kUISubTitleColor;
    [self.view addSubview:_phoneNumberTextField];
    
    _passwordTextField = [[PasswordTextField alloc] init];
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.delegate = self;
    _passwordTextField.font = [UIFont systemFontOfSize:15.f];
    _passwordTextField.textColor = kUISubTitleColor;
    [self.view addSubview:_passwordTextField];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view).offset(VAMargin);
        make.top.mas_equalTo(weakSelf.view).offset(35.f);
    }];
    
    [_phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view).offset(_margin);
        make.right.mas_equalTo(weakSelf.view).offset(-_margin);
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(30.f);
        make.height.mas_equalTo(50);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view).offset(_margin);
        make.right.mas_equalTo(weakSelf.view).offset(-_margin);
        make.top.mas_equalTo(weakSelf.phoneNumberTextField.mas_bottom).offset(0.f);
        make.height.mas_equalTo(50);
    }];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.backgroundColor = kUIDisableTextColor;
//    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"button_background"] forState:UIControlStateNormal];
    _loginBtn.layer.cornerRadius = 10.f;
    [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
//    _forgetPwdButton.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [self.view addSubview:_loginBtn];
    

    
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view).offset(_margin);
        make.right.mas_equalTo(weakSelf.view).offset(-_margin);
        make.height.mas_equalTo(50);
        make.top.mas_equalTo(weakSelf.passwordTextField.mas_bottom).offset(50.f);
    }];
    
}

- (void)loginClick:(UIButton *)sender {
  
}

//- (void)forgetClick:(UIButton *)sender {
//    ForgetpwdFirstViewController *vc = [[ForgetpwdFirstViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}
//
//- (void)registerClick:(UIButton *)sender {
//    RegisterViewController *vc = [[RegisterViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}
//
//- (void)firstLoginConfig{
//    SetFingerprintViewController *vc = [[SetFingerprintViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}

#pragma mark - 键盘通知
- (void)addNoticeForKeyboard {
    
    //注册键盘出现的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    //注册键盘消失的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}




@end
