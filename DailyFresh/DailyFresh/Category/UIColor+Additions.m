//
//  UIColor+Additions.m
//  DailyFresh
//
//  Created by Mac on 2019/5/10.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)


+ (UIColor *)randomColor
{
    int red = (arc4random() % 256)  / 255.0;
    int green = (arc4random() % 256)  / 255.0;
    int blue = (arc4random() % 256)  / 255.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    NSLog(@"%@", color);
    return color;
}

@end
