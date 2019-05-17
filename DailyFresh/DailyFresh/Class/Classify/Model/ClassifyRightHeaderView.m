//
//  ClassifyRightHeaderView.m
//  DailyFresh
//
//  Created by Mac on 2019/5/17.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ClassifyRightHeaderView.h"

@interface ClassifyRightHeaderView ()

@end

@implementation ClassifyRightHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12.f];
        _titleLabel.textColor = kUISubTitleColor;
        [self.contentView addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10.f);
            make.top.mas_equalTo(0.f);
            make.height.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

@end
