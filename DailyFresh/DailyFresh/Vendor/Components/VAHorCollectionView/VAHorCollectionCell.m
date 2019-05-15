//
//  VAHorCollectionCell.m
//  DailyFresh
//
//  Created by Mac on 2019/5/13.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "VAHorCollectionCell.h"

@implementation VAHorCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10.f;
        self.backgroundColor = [UIColor greenColor];
        self.clipsToBounds = YES;
        [self setupView];
    }
    return self;
    
}

-(void)setupView {
    
    // 这里用来初始化子控件
}

@end
