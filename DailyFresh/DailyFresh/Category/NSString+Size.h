//
//  NSString+Size.h
//  DailyFresh
//
//  Created by Mac on 2019/5/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Size)

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
