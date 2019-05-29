//
//  UnderlineTextField.m
//  VankePayApp
//
//  Created by Mac on 2019/1/15.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "UnderlineTextField.h"

@implementation UnderlineTextField

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:216.f/255.f green:216.f/255.f blue:216.f/255.f alpha:1.0].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}


@end
