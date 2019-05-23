//
//  VANStringUtil.m
//  DailyFresh
//
//  Created by Mac on 2019/5/23.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VANStringUtil.h"

@implementation VANStringUtil

/**
 *  校验手机号格式
 *
 *  @param mobile 手机号
 *
 *  @return 结果
 */
+(BOOL) isValidateMobile:(NSString *)mobile{
    
    NSString *phoneRegex = @"^1[0-9]{10}$";
    
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}



/*邮箱验证*/
+(BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/*验证6-20数字、字母密码*/
+ (BOOL) isValidatePassword:(NSString *)password{
    NSString *passwordRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:password];
}

+ (NSString *)convertNullString:(NSString *)string{
    if ([string isNullString] || string == nil) {
        return @"";
    }
    return string;
}

+ (NSString *)converCurrnecyFormate:(NSString *)cent{
//    NSMutableString *result = [NSMutableString stringWithString:cent];

    CGFloat fCent = [cent integerValue];

    NSString *result = [NSString stringWithFormat:@"￥%.2f",fCent/100];
    return result;
    
}


@end
