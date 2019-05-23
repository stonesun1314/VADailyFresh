//
//  VPNSStringUtil.h
//  VankePayApp
//
//  Created by Mac on 2019/1/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VPNSStringUtil : NSObject

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


@end

NS_ASSUME_NONNULL_END
