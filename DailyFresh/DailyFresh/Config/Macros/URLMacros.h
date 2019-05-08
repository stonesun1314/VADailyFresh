//
//  URLMacros.h
//  VankePaySDK
//
//  Created by Mac on 2018/12/17.
//  Copyright © 2018年 Mac. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h

static NSString *staticFullName = @"石头";
static NSString *staticCardNumer = @"6214836551891951";
static NSString *staticIdentityNumber = @"110103199701014933";
static NSString *staticPhoneNumber = @"18018762960";
static NSString *staticLoginPassword = @"aa123456";
static NSString *staticIdType = @"IDENTITY";
static NSString *staticCardType = @"DEBIT";        //[ 储蓄卡:DEBIT, 信用卡:CREDIT ]
static NSString *staticPaypwd = @"410221";         //支付免密
static NSString *staticloginPwd = @"aa123456";

static NSString *smsTypeRegister = @"register";
static NSString *smsTypeForgetPwd = @"forget-password";
static NSString *smsTypeAuthentication = @"authentication";


static NSString *staticBindCardNumber = @"6228480728923246999";     //绑定银行卡

// users
#define user_login_url                  @"/user/v1.0/auth/login"        //用户登录 post
#define user_register_url               @"/user/v1.0/identity/user"     //用户注册 post
#define user_sms_url                    @"/user/v1.0/sms"               //发送验证码 post
#define user_set_fingerprint            @"/user/v1.0/identity/set-fingerprint"  //用户设置指纹 post
#define user_finger_login               @"/user/v1.0/auth/fingerprint-login"    //用户指纹登录 post
#define user_auth_validate              @"/user/v1.0/auth/validate"             //验证用户token是否有效 post
#define user_auth_refresh               @"/user/v1.0/auth/refresh"              //刷新用户token post
#define user_identify_query             @"/user/v1.0/identity/query"            //获取用户详细信息 post
#define user_forget_pwd                 @"/user/v1.0/identity/forget-password"  //忘记密码 put
#define user_change_pwd                 @"/user/v1.0/identity/change-password"  //修改密码 put
#define user_change_nickname            @"/user/v1.0/identity/change-nickname"  //修改用户昵称 put
#define user_auth_logout                @"/user/v1.0/auth/logout"               //用户退出 post

//setting
#define set_app_url                     @"/user/v1.0/setting/app"               //app系统设置 get

//pay
//二维码
#define pay_qrcode_apply                @"/pay/v1.0/qrcodes/apply"          //申请二维码     post
#define pay_qrcode_replay_card          @"/pay/v1.0/qrcodes/reapply/card"   //用户切换卡号申请二维码 post
#define pay_qrcode_transaction_qeury    @"/pay/v1.0/qrcodes/transaction/qeury"       //获取银联附加请求信息和获取二维码被扫支付结果  post
#define pay_qrcode_pwd_check            @"/pay/v1.0/qrcodes/password/check"     //验证输入支付密码的正确性，如果输入支付密码正确，发送附加请求通知给银联 post
//App 内支付
#define pay_apppay_apply                @"/pay/v1.0/apppay/apply"       //App内通过app收银台支付如果商品金额小于免密金额则会免密支付，如果商品金额大于免密金额则会告诉用户输入密码去支付 post
#define pay_apppay_pwd                  @"/pay/v1.0/apppay/password"    //App内通过app收银台支付告诉用户输入密码去支付 post
//生活缴费
#define pay_livebill_query              @"/pay/v1.0/livebill/query"     //获取生活缴费链接

#endif /* URLMacros_h */
