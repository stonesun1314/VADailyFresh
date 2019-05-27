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
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
}


@end
