//
//  NSString+Size.m
//  DailyFresh
//
//  Created by Mac on 2019/5/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

#pragma mark 计算字符串大小
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:dict context:nil].size;
    return textSize;
}

@end
