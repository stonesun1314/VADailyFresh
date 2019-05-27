//
//  UILabel+Line.m
//  DailyFresh
//
//  Created by Mac on 2019/5/27.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "UILabel+Line.h"

@implementation UILabel (Line)

- (void)setMiddleLine:(NSString *)text{
    
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];
    
    // 赋值
    self.attributedText = attribtStr;
    
}

- (void)setBottomLine:(NSString *)text{
    
    // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:text attributes:attribtDic];

    
    // 赋值
    self.attributedText = attribtStr;
    
}

@end
