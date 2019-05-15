//
//  Macros.h
//  VankePaySDK
//
//  Created by Mac on 2018/12/17.
//  Copyright © 2018年 Mac. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#ifndef VP_ENVIRONMENT_CONFIG

#define VP_ENVIRONMENT_CONFIG  1//1:开发环境 2:uat环境 3:测试环境  4:XXX环境   5:压力测试环境

#if CO_ENVIRONMENT_CONFIG==1
#define HTTPURLPREFIX       @"http://10.39.32.158"//@"http://10.39.231.173/account-service"//@"http://10.39.32.158"


#elif CO_ENVIRONMENT_CONFIG==2

#define HTTPURLPREFIX       @"http://202.105.145.243:60003/mta"


#elif CO_ENVIRONMENT_CONFIG==3
#define HTTPURLPREFIX       @"http://192.168.20.100:8082"


#elif CO_ENVIRONMENT_CONFIG==4
#define HTTPURLPREFIX       @"http://192.168.20.105/mta"

#elif CO_ENVIRONMENT_CONFIG==5
#define HTTPURLPREFIX       @"http://192.168.20.20:8082"

#endif
#endif

#define vp_channel_number   @"v00001"


#endif /* Macros_h */


//#import "UIViewControllerCJHelper.h"
//#import "NSObjectCJHelper.h"
//#import "HookCJHelper.h"
//#import "AuthorizationCJHelper.h"
//#import "NSCalendarCJHelper.h"
//#import "NSDateFormatterCJHelper.h"
//#import "NSOperationQueueCJHelper.h"
//#import "WebCJHelper.h"

//转化为weak对象（block循环引用使用时）
#define WeakObj(o) __weak typeof(o) obj##Weak = o;
#define WeakSelf __weak typeof(self) weakSelf = self;

#define is_iPhoneXSerious @available(iOS 11.0, *) && UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom > 0.0

#define DEBUGGER 1 //上线版本屏蔽此宏

#ifdef DEBUGGER
/* 自定义log 可以输出所在的类名,方法名,位置(行数)*/
#define VALog(format, ...) NSLog((@"%s [Line %d] " format), __FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define VALog(...)

#endif


#define kPhoneNumerError        @"请输入正确的手机号"
#define kPasswordError          @"请输入6-20位数字和字母的组合"
#define kVerifyCodeError        @"请输入正确的验证码"

#define kUnDevelopedTip         @"正在开发中..."


typedef NS_ENUM(NSInteger, BindCardType)
{
    BindBankCardTypeOpenAccount     = 1,
    BindBankCardTypeBindCard        = 2,
};

static bool responseSuccess(id response){
    NSString *code = [response objectForKey:@"code"];
    if ([code isEqualToString:@"0"]) {
        return true;
    } else {
        return false;
    }
}

static NSString* responseMessage(id response){
    NSString *message = [response objectForKey:@"message"];
    if (message.length > 0) {
        return message;
    } else {
        return @"";
    }
    return @"";
}

//========= Device ======
//判断是否是iPad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPHONEXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)


//iPhoneX系列
#define Height_StatusBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 44.0 : 20.0)
#define Height_NavBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 88.0 : 64.0)
#define Height_TabBar ((IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES) ? 83.0 : 49.0)
