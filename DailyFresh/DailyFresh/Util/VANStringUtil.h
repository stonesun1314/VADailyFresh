//
//  VANStringUtil.h
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VANStringUtil : NSString

/**
 *  校验手机号格式
 *
 *  @param mobile 手机号
 *
 *  @return 结果
 */
+(BOOL) isValidateMobile:(NSString *)mobile;

/**
 *  校验邮箱格式
 *
 *  @param email 需要校验的邮箱
 *
 *  @return 返回结果
 */
+(BOOL) isValidateEmail:(NSString *)email;

/**
 *  校验6-20位数字和字母组合的密码
 *
 *  @param password 需要校验的密码
 *
 *  @return 返回结果
 */
+ (BOOL) isValidatePassword:(NSString *)password;




/**
 把 nil, NSNull, '<Null>'等转化为空字符串，如果不是空字符串则返回原字符串
 
 @param string 要转话的字符串
 */
+ (NSString *)convertNullString:(NSString *)string;



/**
 把单位为分的字符串转化为人民币货币格式

 @param cent 分
 @return 返回 ￥123.00
 */
+ (NSString *)converCurrnecyFormate:(NSString *)cent;


@end

NS_ASSUME_NONNULL_END
