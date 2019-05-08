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
