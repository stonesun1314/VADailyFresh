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
        
        self.textLabel.textColor = kUISubTitleColor;
        self.textLabel.font = [UIFont systemFontOfSize:12.f];
    }
    return self;
}

@end
